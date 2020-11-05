layui.define(function(exports) {
  exports('conf', {
    container: 'website',
    containerBody: 'website-body',
    v: '2.0',
    base: layui.cache.base,
    css: layui.cache.base + 'css/',
    views: layui.cache.base + 'views/',
    viewLoadBar: true,
    debug: layui.cache.debug,
    name: 'website',
    entry: '/index',
    engine: '',
    eventName: 'website-event',
    tableName: 'website',
    requestUrl: './'
  })
});
