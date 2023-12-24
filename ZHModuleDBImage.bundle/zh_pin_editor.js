var focusRange;

function backuprange() {
    var selection = window.getSelection();
    focusRange = selection.getRangeAt(0);
    focusRange.setEnd(focusRange.startContainer, focusRange.startOffset);
}

function restorerange() {
    if (!focusRange) {
        return;
    }
    var selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(focusRange);
}

// 添加字符串 replaceAll 方法
String.prototype.replaceAll = function(search, replacement) {
    return this.replace(new RegExp(search, 'g'), replacement);
};

$(document).ready(function () {
                  var content = $('#content');
                  
                  // 监听输入@事件
                  content.on('beforeinput', function(e) {
                             if (e.data == '@') {
                             e.preventDefault();
                             backuprange()
                             window.location.href = "zhihu:mention";
                             }
                             });
                  
                  // 监听粘贴事件
                  content.on('paste', function(e) {
                             e.preventDefault();
                             var text = (e.originalEvent || e).clipboardData.getData('text/plain');
                             text = text.replace(/\n/g, "<br>");
                             if (isUrl(text)) {
                             window.location.href = ['zhihuinternal://paste?text=', text].join('');
                             } else {
                             document.execCommand("insertHtml", false, text);
                             }
                             });
                  
                  // 监听内容输入
                  content.on('input', function() {
                                 var node = document.getSelection().anchorNode;
                                 if (node.nodeType == 3) {
                                     var selector = $(document.getSelection().anchorNode.parentNode);
                                         if (selector.hasClass('member_mention')) {
                                             selector.remove();
                                         }
                                         if (selector.hasClass('comment_img')) {
                                             selector.remove();
                                         }
                                         if (selector.hasClass('comment_gif')) {
                                            selector.remove();
                                         }
                                         if (selector.hasClass('comment_sticker')) {
                                            selector.remove();
                                         }
                                         if (selector.hasClass('videox')) {
                                            selector.remove();
                                         }
                                 }
                             });
                  
                  // 监听光标的移动
                  document.addEventListener("selectionchange", function() {
                                window.location = "zhihuinternal://selectionchange";
                  }, false);

});

function isUrl(s) {
    var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
    return regexp.test(s);
}

function clearContent() {
    $('#content').html("");
}


// --------------- for content margin -----------------

// add css in header
function addCSSinHead( css_string ) {
    
    var ID = 'custom_css';
    var cssNode = document.getElementById(ID);
    if (cssNode != null) {
        cssNode.innerHTML = css_string;
    } else {
        var head = document.getElementsByTagName('head')[0];
        var cssNode = document.createElement('style');
        cssNode.setAttribute('id', ID);
        cssNode.innerHTML = css_string;
        head.appendChild(cssNode);
    }
}

function addCSSinHeadWhenDocumentReady( css_string ) {
    $(document).ready(function () {
                      addCSSinHead(css_string)
                      });
}

function getCursorPosition() {
    var sel = document.selection, range, rect;
    var x = 0, y = 0;
    if (sel) {
        if (sel.type != "Control") {
            range = sel.createRange();
            range.collapse(true);
            x = range.boundingLeft;
            y = range.boundingTop;
        }
    } else if (window.getSelection) {
        sel = window.getSelection();
        if (sel.rangeCount) {
            range = sel.getRangeAt(0).cloneRange();
            if (range.getClientRects) {
                range.collapse(true);
                if (range.getClientRects().length>0){
                    rect = range.getClientRects()[0];
                    x = rect.left;
                    y = rect.top;
                }
            }
            // Fall back to inserting a temporary element
            if (x == 0 && y == 0) {
                var span = document.createElement("span");
                if (span.getClientRects) {
                    // Ensure span has dimensions and position by
                    // adding a zero-width space character
                    span.appendChild( document.createTextNode("\u200b") );
                    range.insertNode(span);
                    rect = span.getClientRects()[0];
                    x = rect.left;
                    y = rect.top;
                    var spanParent = span.parentNode;
                    spanParent.removeChild(span);
                    
                    // Glue any broken text nodes back together
                    spanParent.normalize();
                }
            }
        }
    }
    return y;
}

// 获取光标相对于第一个字符的偏移量
// http://stackoverflow.com/a/4812022
function getCaretOffset(target) {
    var caretOffset = 0;
    if (typeof window.getSelection != 'undefined') {
        var range = window.getSelection().getRangeAt(0);
        var preCaretRange = range.cloneRange();
        preCaretRange.selectNodeContents(target);
        preCaretRange.setEnd(range.endContainer, range.endOffset);
        caretOffset = preCaretRange.toString().length;
    } else if (typeof document.selection != 'undefined' && document.selection.type != 'Control') {
        var textRange = document.selection.createRange();
        var preCaretTextRange = document.body.createTextRange();
        preCaretTextRange.moveToElementText(target);
        preCaretTextRange.setEndPoint('EndToEnd', textRange);
        caretOffset = preCaretTextRange.text.length;
    } 
    return caretOffset;
}

// 移动光标到内容尾部
// https://stackoverflow.com/a/3866442
function moveCaretToEnd() {
    var target = document.getElementById("content");
    var range = document.createRange();
    range.selectNodeContents(target);
    range.collapse(false);
    var selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(range);
}

function getCaretTextLength() {
    var editor = $('#content');
    var target = editor[0];
    var position = getCaretOffset(target);
    return position;
}

// 将 index 之后的文本替换成 tag
function replaceHashTag(index, tag) {
    var editor = $('#content');
    var text = editor.html();
    text = text.substring(0, index) + tag + '&nbsp';
    $('#content').html(text);
    
    moveCaretToEnd();
}

