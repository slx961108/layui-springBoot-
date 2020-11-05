layui.extend({
    website: 'lay/modules/website',
    validate: 'lay/modules/validate'
}).define(['website', 'conf', 'jquery'], function (exports) {
    layui.website.initPage();
    // 拓展jq函数
    var $ = layui.jquery;
    $.fn.serializeJson = function() {
        var serializeObj = {};
        $(this.serializeArray()).each(function(){
            serializeObj[this.name] = this.value;
        });
        return serializeObj;
    };
    exports('index', {});
});