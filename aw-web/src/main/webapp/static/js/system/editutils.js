/**
 *  页面编辑工具
 */
define(function(require, exports) {
	
	/**
	 * 修改 标签的宽度
	 */
	exports.setWidth = function($object,value) {
		$object.css("width", value);
	};
	
	/**
	 * 修改 标签的高度
	 */
	exports.setHeight = function($object,value) {
		$object.css("height", value);
	};
	
	/**
	 * 修改 标签的背景
	 */
	exports.setBgColor = function($object,value) {
		$object.css("background-color", value);
	};
    /**
     * 修改 标签的图片
     */
    exports.setBgImg = function($object,value) {
        $($object).css("background-image","url("+value+")");
    };

    exports.setBgRepeat = function($object,value){
        $($object).css("background-repeat",value);
	}

    exports.setBgSize = function($object,value){
        $($object).css("background-size",value);
    }

    exports.setBgFix = function($object,value){
        $($object).css("background-attachment",value);
    }

    exports.setTextColor = function($object,value){
        $($object).css("color",value);
    }




});