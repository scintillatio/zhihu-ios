var docCookies = {
    setCookie: function (name, value, domain, path, expires, secure) {
        // name 检查与 cookie 拼接引用自 https://developer.mozilla.org/en-US/docs/DOM/document.cookie
        if (!name || /^(?:expires|max\-age|path|domain|secure)$/i.test(name)) { return false; }
        document.cookie = name + "=" + value + (domain ? "; domain=" + domain : "") + (path ? "; path=" + path : "") + (expires ? "; expires=" + expires : "") + (secure ? "; secure" : "");
        return true;
    },
    setCookies: function (cookieMaps) {
        if (!cookieMaps) { return false; }
        try {
            cookieMaps.forEach(function (cookieMap) {
                docCookies.setCookie(cookieMap.name, cookieMap.value, cookieMap.domain, cookieMap.path, cookieMap.expires, cookieMap.secure);
            });
        } catch(e) { 
            console.log(e.name + ":" + e.message);
        }
    }
};
try { docCookies.setCookies(__COOKIE_JSON_STRING__); } catch(e) { console.log(e.name + ":" + e.message); }
