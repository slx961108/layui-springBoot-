// 定义常用的校验，常用的正则 https://www.open-open.com/code/view/1430625516632
layui.define(['jquery'], function (exports) {
    var $ = layui.jquery;
    exports('dict', {
        getByCode: function (code) {
            if (!isEmpty(code)) {
                var result = '';
                $.ajax({
                    url: ctx + 'sysDict/code/' + code,
                    async: false,
                    type: 'get',
                    success: function (data) {
                        debugger
                        result = data.data;
                    }
                });
                return result;
            }
        },

    });

    function isEmpty(obj) {
        return typeof obj == 'undefined' || obj == null || obj === '';
    }
});