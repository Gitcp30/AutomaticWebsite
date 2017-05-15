/*
 * Copyright (c) 2015 xuerdongcom@126.com All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.jmu.service.Patchca;

import org.apache.commons.lang3.StringUtils;
import org.patchca.background.BackgroundFactory;
import org.patchca.color.ColorFactory;
import org.patchca.filter.ConfigurableFilterFactory;
import org.patchca.filter.library.AbstractImageOp;
import org.patchca.filter.library.WobbleImageOp;
import org.patchca.filter.predefined.CurvesRippleFilterFactory;
import org.patchca.font.RandomFontFactory;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.text.renderer.BestFitTextRenderer;
import org.patchca.utils.encoder.EncoderHelper;
import org.patchca.word.RandomWordFactory;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 验证码服务类
 */
@Service
public class PatchcaService {

	private static ConfigurableCaptchaService cs = new ConfigurableCaptchaService();
	private static Random random = new Random();

	@PostConstruct
	public void init() {
		cs.setColorFactory(new ColorFactory() {
			@Override
			public Color getColor(int x) {
				int[] c = new int[3];
				int i = random.nextInt(c.length);
				for (int fi = 0; fi < c.length; fi++) {
					if (fi == i) {
						c[fi] = random.nextInt(71);
					} else {
						c[fi] = random.nextInt(256);
					}
				}
				return new Color(c[0], c[1], c[2]);
			}
		});

		cs.setFilterFactory(new CurvesRippleFilterFactory());

		// 自定义验证码图片背景
		MyCustomBackgroundFactory backgroundFactory = new MyCustomBackgroundFactory();
		cs.setBackgroundFactory(backgroundFactory);

		// 随机字符生成器,去除掉容易混淆的字母和数字,如o和0等
		RandomWordFactory wf = new RandomWordFactory();
		wf.setCharacters("abcdefghkmnpqstwxyz23456789ABCDEFGHGKLMNPQRSTUVWXYZ");
		wf.setMaxLength(4);
		wf.setMinLength(4);
		cs.setWordFactory(wf);

		// 随机字体生成器
		RandomFontFactory ff = new RandomFontFactory();
		ff.setMinSize(32);
		ff.setMaxSize(28);
		cs.setFontFactory(ff);

		// 图片滤镜设置
		ConfigurableFilterFactory filterFactory = new ConfigurableFilterFactory();
		List<BufferedImageOp> filters = new ArrayList<BufferedImageOp>();
		WobbleImageOp wobbleImageOp = new WobbleImageOp();
		wobbleImageOp.setEdgeMode(AbstractImageOp.EDGE_MIRROR);
		wobbleImageOp.setxAmplitude(2.0);
		wobbleImageOp.setyAmplitude(1.0);
		filters.add(wobbleImageOp);
		filterFactory.setFilters(filters);
		cs.setFilterFactory(filterFactory);

		// 文字渲染器设置
		BestFitTextRenderer textRenderer = new BestFitTextRenderer();
		textRenderer.setBottomMargin(3);
		textRenderer.setTopMargin(3);
		cs.setTextRenderer(textRenderer);
	}

	public void resetcs(int width, int height) {
		cs.setWidth(width);
		cs.setHeight(height);
	}

	/**
	 * 	生成验证码
	 * @param width
	 * @param height
	 * @param os
	 * @param session 存储验证在session
	 * @throws IOException
	 */
	public void getPatchca(int width, int height, OutputStream os,HttpSession session) throws IOException {
		resetcs(width, height);
		String token = EncoderHelper.getChallangeAndWriteImage(cs, "png", os);
		session.setAttribute("patchca",token);
	}

	/**
	 * ajax验证验证码 不会去除缓存中的验证码
	 * @param session
	 * @param value
	 * @return
	 */
	public Boolean ajaxValidatePatchca(HttpSession session, String value) {
		boolean b = false;
		String patchca = (String) session.getAttribute("patchca");
		if (StringUtils.isNotEmpty(patchca)) {
			b = value.equalsIgnoreCase(patchca);
		}
		return b;
	}

	/**
	 * 提交校验验证码 无论验证是否成功都会验证后删除缓存
	 * @param session
	 * @param value
	 * @return
	 */
	public Boolean validatePatchca(HttpSession session, String value) {
		boolean b = false;
		String patchca = (String) session.getAttribute("patchca");
		if (StringUtils.isNotEmpty(patchca)) {
			b = value.equalsIgnoreCase(patchca);
		}
		session.removeAttribute("patchca");
		return b;
	}

	/**
	 * 
	 * 自定义验证码图片背景,主要画一些噪点和干扰线
	 */

	private class MyCustomBackgroundFactory implements BackgroundFactory {

		private Random random = new Random();

		public void fillBackground(BufferedImage image) {

			Graphics graphics = image.getGraphics();

			// 验证码图片的宽高

			int imgWidth = image.getWidth();

			int imgHeight = image.getHeight();

			// 填充为白色背景

			graphics.setColor(Color.WHITE);

			graphics.fillRect(0, 0, imgWidth, imgHeight);

			// 画100个噪点(颜色及位置随机)

			for (int i = 0; i < 100; i++) {

				// 随机颜色

				int rInt = random.nextInt(255);

				int gInt = random.nextInt(255);

				int bInt = random.nextInt(255);

				graphics.setColor(new Color(rInt, gInt, bInt));

				// 随机位置

				int xInt = random.nextInt(imgWidth - 3);

				int yInt = random.nextInt(imgHeight - 2);

				// 随机旋转角度

				int sAngleInt = random.nextInt(360);

				int eAngleInt = random.nextInt(360);

				// 随机大小

				int wInt = random.nextInt(6);

				int hInt = random.nextInt(6);

				graphics.fillArc(xInt, yInt, wInt, hInt, sAngleInt, eAngleInt);

				// 画5条干扰线
				if (i % 20 == 0) {

					int xInt2 = random.nextInt(imgWidth);

					int yInt2 = random.nextInt(imgHeight);

					graphics.drawLine(xInt, yInt, xInt2, yInt2);

				}
			}
		}
	}

}
