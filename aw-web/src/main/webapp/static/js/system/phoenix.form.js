define(function(require, exports, module) {
    !function($) {
       /* $.fn.toObject = function() {
            var inputs = {};
            var doms = $(this).find("input[name],select[name],textarea[name],.sns-combobox,.sns-popwin");
            $(doms).each(function(i, elm) {
                var inputName = $(this).attr("name");
                var inputVal = '';
                if($(this).attr("type") == 'checkbox'){
                	inputVal = $(this)[0].checked;
                }else{
                	inputVal = $(this).val();
                }
                inputs[inputName] = inputVal;
            });
            
        	//复选框组收集
        	var checkboxgroup = $(this).find(".sns-checkboxgroup");
        	$(checkboxgroup).each(function(i, elm) {
        		var inputName = $(this).attr("name");
        		var chk_value =[]; 
        		$("input[name='"+inputName+"']:checked").each(function(){ 
        			chk_value.push($(this).val()); 
        		}); 
        		inputs[inputName] = chk_value.join(",");
        	});
            
            return inputs;
        };
        $.fn.toForm = function(vo) {
            if (vo == null)
                vo = new Array();
            var checkboxgroup = $(this).find(".sns-checkboxgroup input");
            var doms = $(this).find("input[name],select[name],textarea[name],.sns-combobox,.sns-popwin");
            doms.each(function(i, elm) {
                var value = vo[elm.name];
                var tagName = elm.tagName;
                if (tagName == 'INPUT') {
                    var type = (elm.getAttribute("type") || 'TEXT').toUpperCase();
                    // 按钮排除处理
                    if (type == 'BUTTON' || type == 'SUBMIT') {
                        return;
                    } else if (type == 'CHECKBOX') {
                    	value = value.split(",");//数据库存的值是 字符串 以逗号隔开的数据
                    	$(checkboxgroup).each(function(i, elm) {//先清理勾选的
                    		$(this).removeAttr('checked');
                    	});
                    	$(checkboxgroup).each(function(i, elm) {//重新选择
                    		var inputTarget = $(this);
                    		var inputVal = $(this).val();
                    		$.each(value, function(i, item){      
                    		      if(inputVal == item){
                    		    	  inputTarget.prop('checked',true);
                    		      }
                    		});   
                    	});
                    } else if (type == 'RADIO') {

                    } else {
                        if ($(elm).hasClass("sns-date")) {
                        } else {
                            $(elm).val(value);
                        }
                    }
                } else if (tagName == 'SELECT') {
                    // 设置select2的选中值
                    $(elm).val(value).trigger("change");
                } else {
                    $(elm).val(value);
                }
            });
        };
        /!**
         * 重置表单数据
         *!/
        $.fn.reset = function() {
            $(this).find("input,textarea").val('').removeAttr('checked').removeAttr('selected');
            $(this).find("option").removeAttr('checked').removeAttr('selected');
        };

        $.fn.validateForm = function() {
            var doms = $(this).find("input[name],select[name],textarea[name],.sns-combobox,.sns-popwin");
            doms.each(function(i, elm) {
                var opts = $(elm).snsOptions();
                if (opts.require && opts.require == true) {
                    var value = $(elm).val();
                    console.log("---value = " + value);
                }
                if (opts.dataType) {
                    console.log("---dataType = " + opts.dataType);
                }
                if (opts.format) {
                    console.log("--- format =" + opts.format);
                }
            });
        };*/

        $.fn.serializeObject = function() {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
    }(jQuery);
});
