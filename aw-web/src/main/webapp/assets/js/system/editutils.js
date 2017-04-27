/**
 *  页面编辑工具
 */
define(function(require, exports) {
	
	/**
	 * 修改 标签的宽度
	 */
	exports.changeWidth = function($object,value) {
		$object.css("width", value);
	};
	
	/**
	 * 修改 标签的高度
	 */
	exports.changeHeight = function($object,value) {
		$object.css("height", value);
	};
	
	/**
	 * 修改 标签的背景
	 */
	exports.changeBackground = function($object,value) {
		$object.css("background-color", value);
	};


});