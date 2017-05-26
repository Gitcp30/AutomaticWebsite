package com.jmu.controller.admin;

import com.jmu.common.AjaxPageResponse;
import com.jmu.common.AjaxResponse;
import com.jmu.constant.Constants;
import com.jmu.domain.Product;
import com.jmu.domain.User;
import com.jmu.domain.vo.ProductVo;
import com.jmu.service.admin.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * @Description: 产品控制类
 * @author: zhouzunrong
 * @create: 2017-05-10 14:10
 * @version: 1.0
 **/
@Controller
@RequestMapping("/admin/web")
public class ProductController {

    @Autowired
    private ProductService productService;


   @RequestMapping(value = "productPage",method = RequestMethod.GET)
   public String page(){
       return "admin/web/productList";
   }


    @ResponseBody
    @RequestMapping("getProduct")
    public AjaxPageResponse getProduct(ProductVo productVo, AjaxPageResponse page, HttpSession session){
        User user = (User) session.getAttribute("currentUser");
        productVo.setCompanyId(user.getCompanyId());
        return  productService.findAll(productVo,page);
    }



    @ResponseBody
    @RequestMapping(value = "/updateProduct")
    public AjaxResponse updateProduct(@RequestParam(value = "photo",required = false) MultipartFile fileData,
                                      Product product, HttpSession session) throws IOException {
        if(fileData!=null && fileData.getOriginalFilename()!=null && fileData.getOriginalFilename().length()>0){
            String originalFilename = fileData.getOriginalFilename();
            String newFileName = UUID.randomUUID().toString().replace("-", "") + originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(Constants.PRODUCT_PIC_PATH+newFileName);
            fileData.transferTo(newFile);
            product.setProductImg("/pic/product/"+newFileName);
        }
        User currentUser = (User) session.getAttribute("currentUser");
        product.setModifier(currentUser.getUserId());
        return  productService.updateProduct(product);
    }




    @ResponseBody
    @RequestMapping(value = "/saveProduct")
    public AjaxResponse saveProduct(@RequestParam(value = "photo",required = false) MultipartFile fileData,
                                      Product product, HttpSession session) throws IOException {
        //上传图片
        if(fileData!=null && fileData.getOriginalFilename()!=null && fileData.getOriginalFilename().length()>0){
            String originalFilename = fileData.getOriginalFilename();
            String newFileName = UUID.randomUUID().toString().replace("-", "") + originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(Constants.PRODUCT_PIC_PATH+newFileName);
            fileData.transferTo(newFile);
            product.setProductImg("/pic/product/"+newFileName);
        }
        User currentUser = (User) session.getAttribute("currentUser");
        product.setCompanyId(currentUser.getCompanyId());
        product.setCreator(currentUser.getUserId());
        return productService.saveProduct(product);
    }


    @ResponseBody
    @RequestMapping("deleteProduct")
    public AjaxResponse deleteProduct(@RequestParam(value="productIds[]",required=true) String[] productIds){
        if (productIds != null && productIds.length > 0){
            return productService.deleteProduct(productIds);
        }
        return AjaxResponse.fail("没有可删除的数据！");
    }


    @ResponseBody
    @RequestMapping("updateProductState")
    public AjaxResponse updateProductState(Short state, @RequestParam(value="productIds[]",required=true) String[] productIds, HttpSession session){

        if(state == null || productIds ==null){
            return AjaxResponse.fail("产品为空");
        }
        // userVo启用数据
        User user = (User) session.getAttribute("currentUser");

        ProductVo productVo = new ProductVo();
        productVo.setModifyTime(new Date());
        productVo.setModifier(user.getUserId());
        productVo.setState(state);
        productVo.setProductIds(productIds);
        return productService.updateProductState(productVo);
    }

}