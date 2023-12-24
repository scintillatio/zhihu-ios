!(function (window, document){

    var callbacks = [];
    var pending = false;
    var timerFunc = null;

    function isNative(Ctor) {
        return typeof Ctor === 'function' && /native code/.test(Ctor.toString())
    }

    if (typeof Promise !== 'undefined' && isNative(Promise)) {
        var p = Promise.resolve()
        timerFunc = () => {
          p.then(flushCallbacks)
        }
        isUsingMicroTask = true
      } else if (
        !isIE &&
        typeof MutationObserver !== 'undefined' &&
        (isNative(MutationObserver) ||
          // PhantomJS and iOS 7.x
          MutationObserver.toString() === '[object MutationObserverConstructor]')
      ) {
        // Use MutationObserver where native Promise is not available,
        // e.g. PhantomJS, iOS7, Android 4.4
        // (#6466 MutationObserver is unreliable in IE11)
        let counter = 1
        const observer = new MutationObserver(flushCallbacks)
        const textNode = document.createTextNode(String(counter))
        observer.observe(textNode, {
          characterData: true
        })
        timerFunc = () => {
          counter = (counter + 1) % 2
          textNode.data = String(counter)
        }
        isUsingMicroTask = true
      } else if (typeof setImmediate !== 'undefined' && isNative(setImmediate)) {
        // Fallback to setImmediate.
        // Technically it leverages the (macro) task queue,
        // but it is still a better choice than setTimeout.
        timerFunc = () => {
          setImmediate(flushCallbacks)
        }
      } else {
        // Fallback to setTimeout.
        timerFunc = () => {
          setTimeout(flushCallbacks, 0)
        }
    }

    function flushCallbacks() {
        pending = false
        var copies = callbacks.slice(0)
        callbacks.length = 0
        for (var i = 0; i < copies.length; i++) {
            copies[i]()
        }
    }

    function nextTick(cb, ctx) {
        callbacks.push(function() {
            if (cb) {
                cb.call(ctx)
            }
        })
        if (!pending) {
            pending = true
            timerFunc()
        }
    }

    window.nextTick = nextTick;

})(window, document)
