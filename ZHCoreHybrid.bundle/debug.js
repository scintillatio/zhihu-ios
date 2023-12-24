var head = document.head || document.getElementsByTagName('head')[0] || document.documentElement;
var script = document.createElement("script");
var timestamp = new Date().getTime();
script.src = 'https://debugger.in.zhihu.com/debugger/zhihu-debugger.js?v='+timestamp;
head.append(script);
script.onload = script.onreadystatechange = function() {
   ZhihuDebugger && ZhihuDebugger.ready();
}