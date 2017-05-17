/**
 * 全局通用常量
 */
define(function() {
	return {

        /**
         * 单位状态（0：正常，1：锁定 ，2:审核中 3：审核失败：4审核成功
         */
    	STATE_NORMAL:0,
    	STATE_LOCK:1,
    	AUDITING_ING:2,
        AUDITING_FAIL:3,
        AUDITING_SUCCESS:4,

        /**
		 * ajaxResponse 返回code状态
         */
		CODE_SUCCESS :'0',//成功
		CODE_FAIL :'1',//失败
		CODE_UNAUTHORIZED:'2',//权限不足
		CODE_TIMEOUT:'3',//session超时

		
		//  以下参考
		DELETE_LOADING_TIP : '正在删除。。。',
		SAVE_LOADING_TIP : '正在保存...',
		ENABLE_LOADING_TIP : '启用中...',
		DISABLE_LOADING_TIP : '停用中...',
		NO_SELECT_RECORD_TIP : '请选择记录!',
		DELETE_SUCCESS : '删除成功！',
		DELETE_FAILURE : '删除失败！',
		SAVE_SUCCESS : '保存成功',
		SAVE_FAILURE : '保存失败',
		OPERATE_SUCCESS : '操作成功！',
		OPERATE_FAILURE : '操作失败',
		SELECT_RECORD_ONLY_ONE : '请选择一条记录！',
		NOT_AUDITING_ING:'当前记录不是审核状态!',
		ENABLE : '0',
		DISABLE : '1',
		SYSTEM_ERROR:'系统错误，请重试！',
		NO_DATA_OPERATE:'没有可操作的记录！'

	};
});