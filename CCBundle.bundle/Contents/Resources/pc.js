/**
 * dp
 *
 * Version 0.1.5
 *
 * Created by shanglt on 2018/05/21.
 */
!(function (window, document) {

  var dpVersion = 106 // 大于等于106使用新版dpa, 为了解决极速翻页一直loading问题重构逻辑的dpa

  var openWaterMark = Utils.getURLParameter('openWaterMark') == 1
  var roomWatermark = Utils.getURLParameter('roomWatermark') == 1
  var roomType = Utils.getURLParameter('roomType')
  var roomid = 0
  var accountid = 0
  var type = 0
  var recordId = 0
  var token = 0
  // if (isOpenWaterMark) {
    roomid = Utils.getURLParameter('roomId')
    accountid = Utils.getURLParameter('acountId')
    type = Utils.getURLParameter('type')
    recordId = Utils.getURLParameter('recordId')
    token = Utils.getURLParameter('token')
  // }
  /**
   * ispring 的HTML页面宽度和高度如果超过了原始的宽度和高度，布局上会存在问题，
   * 通过代码：
   * */
  var PC = function () {

    var ifr = document.getElementById('ifr')
    var img = document.getElementById('picture_one')
    var wb = document.getElementById('whiteBoard')
    var wbContext = wb.getContext('2d')

    this.currentPageNum = -1
    this.imgParentNode = document.getElementById('dp')
    this.ifr = ifr
    this.wb = wb
    this.img = img
    this.wbContext = wbContext

    this.displayMode = new DisplayMode()
    // this.db = new DrawingBoard();

    // 当前翻页数据，默认没有翻页数据
    this.current = {
      docId: 'nodoc',
      docName: '暂无文档',
      docTotalPage: 0,
      width: '200',
      height: '200',
      pageTitle: '暂无文档',
      pageNum: 0,
      url: '',
      mode: 0,
      time: 0
    };

    var report = Utils.getURLParameter('report') // 上报开关
    // ccTrack 初始化
    if (report == 1 && window && window.ccTrack) {
      ccTrack.init({
        business: '2001',
        roomid: roomid,
        accountid: accountid,
        platform: 'dp',
        event_ver: '1.0'
      })
    }

    (function (p) {
      // p.img.onload = function () {
      //     this.style.visibility = '';
      // };

      p.ifr.onload = function () {
        // console.log('dp iframe is onload ' + this.src);

        if (!this.src) {
          return
        }

        var width = this.style.width.replace('px', '')
        var height = this.style.height.replace('px', '')

        setTimeout(function () {
          Utils.pmToIfr({
            action: 'resize',
            width: width,
            height: height
          })
        }, 50)
      }
    })(this)
  }

  // 数据上报
  PC.prototype.ccTrack = function (obj) {
    try {
      if (!window || !window.ccTrack) return
      ccTrack.tragger(obj)
    } catch (e) {}
  }


  PC.prototype.showDefaultPageChange = function () {
    // 画板展示的宽和高
    var dpDisplayedWidth = window.innerWidth
    var dpDisplayedHeight = window.innerHeight

    var pc = this
    pc.ifr.style.display = 'none'
    pc.wb.style.display = 'none'
    pc.isDefaultImage = true
    var img = pc.img

    img.style.display = 'block'
    img.style.marginLeft = ''
    img.style.marginTop = ''

    // 默认部署宽高与实际宽高一致
    var displayedWidth = 100
    var displayedHeight = 120

    img.style.marginLeft = ((dpDisplayedWidth - displayedWidth) / 2) + 'px'
    img.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
    img.style.width = displayedWidth + 'px'
    img.style.height = displayedHeight + 'px'

    img.src = '//image.csslcloud.net/dp/d.png'


  }
  PC.prototype.sliderChange = function (l) {
    // pageAnimtionArr.shift(0, 1)

    if (this.current.mode !== 1) { // 急速动画页码更新 普通动画dpa给的回调currentSlideIndex永远是0  修复动画丢失问题
      this.currentPageNum = l
    }

    if (isPageFinishEnd) {
      isPageingState = false
      clearTimeout(pageChangeTimer)
      pageChangeTimer = null
    }
    isLoadingState = false
    if (typeof window.animationSliderChange === 'function') {//提供给ios回调
      //console.log("111dp IOS 文档加载完成回调");
      window.animationSliderChange(l)

    }
    if (window.android && typeof window.android.animationSliderChange === 'function') {//提供给android的回调
      //console.log("111dp ANDROID 文档加载完成回调");
      window.android.animationSliderChange(l)
    }
    try {
      window.webkit.messageHandlers.animationSliderChange.postMessage({'index': l})
    } catch (e) {

    }

    Utils.pmToParent({
      action: 'animationSliderChange',
      sliderIndex: l
    })
    this.db.resetDrawCurrentPage()
  }
  PC.prototype.animationCallback = function (data) {
    var currentPageChange = this.current
    if (currentPageChange.isAnimationFastestMode) {
      if (currentPageChange.pageNum == data.currentSlideIndex && data.currentStepIndex == 0) {
        //this.ifr.style.visibility = '';
        this.current.isReadyTriggerAnimation = true
      }
    } else if (currentPageChange.isAnimationSlowMode) {
      // this.ifr.style.visibility = '';
      this.current.isReadyTriggerAnimation = true
    }
    if (typeof window.dpAnimateLoadComplete === 'function') {
      //console.log("222dp IOS 文档加载完成回调");
      window.dpAnimateComplete(data)
    }
    if (window.android && typeof window.android.dpAnimateLoadComplete === 'function') {
      //console.log("222dp ANDROID 文档加载完成回调");
      window.android.dpAnimateComplete(data)
    }
    try {
      window.webkit.messageHandlers.dpAnimateComplete.postMessage({ data: JSON.stringify(data)})
    } catch (e) {

    }
    Utils.pmToParent({
      action: 'dpAnimateComplete',
      value: data
    })
    this.current.triggerAnimationStep = data.currentStep
  }

  /**
   * 触发动画
   *
   * */
  var animationTimer
  PC.prototype.animation = function (a) {
    var _this = this
    if (!isPageingState && !isLoadingState && this.currentPageNum == a.pageNum) {
      if (a.pageNum) {   //TODO 小班课ios 端存在数据传输格式不正确问题兼容
        if (this.currentPageNum == a.pageNum) {
          Utils.pmToIfr({
            action: 'animation_change',
            step: a.step
          })
        }
      } else {
        Utils.pmToIfr({
          action: 'animation_change',
          step: a.step
        })
      }
    } else {
      animationTimer = setTimeout(function () {
        _this.animation(a)
      }, 500)
    }
  }

  /**
   * resize
   *
   * */
  PC.prototype.resize = function (w, h) {
    // 画板展示的宽和高
    var dpDisplayedWidth = w
    var dpDisplayedHeight = h
    var d = this.current
    var img = document.getElementById('picture_one')
    if (this.current.isAnimation) {
      // 文档实际的宽和高
      var practicalWidth = d.width
      var practicalHeight = d.height

      // 垂直方向优先
      var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)

      var pc = this

      img.style.display = 'none'
      pc.wb.style.display = 'none'

      var ifr = pc.ifr
      ifr.style.display = 'block'
      ifr.style.marginTop = ''
      ifr.style.marginLeft = ''

      // 默认部署宽高与实际宽高一致
      var displayedWidth = practicalWidth
      var displayedHeight = practicalHeight
      var displayedMarginTop = 0
      var displayedMarginLeft = 0

      if (pc.displayMode.isSuitableForWidth) {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

        if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
          displayedMarginTop = (dpDisplayedHeight - displayedHeight) / 2
        }
      } else if (pc.displayMode.isSuitableForWindow) {
        if (isVerticalDisplayedPriority) {
          displayedHeight = dpDisplayedHeight
          displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight

          displayedMarginLeft = (dpDisplayedWidth - displayedWidth) / 2
        } else {
          displayedWidth = dpDisplayedWidth
          displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

          displayedMarginTop = (dpDisplayedHeight - displayedHeight) / 2
        }
      }

      ifr.style.width = displayedWidth + 'px'
      ifr.style.height = displayedHeight + 'px'
      if (displayedMarginTop > 0) {
        ifr.style.marginTop = displayedMarginTop + 'px'
      }
      if (displayedMarginLeft > 0) {
        ifr.style.marginLeft = displayedMarginLeft + 'px'
      }
      pc.db.reset(ifr)
      setTimeout(function () {
        Utils.pmToIfr({
          action: 'resize',
          width: ifr.style.width.replace('px', ''),
          height: ifr.style.height.replace('px', '')
        })
      }, 30)
    } else if (this.current.isJpg) {
      // 文档实际的宽和高
      var practicalWidth = d.width
      var practicalHeight = d.height
      if (parseInt(d.width, 10) == 0 || parseInt(d.height, 10) == 0 || (typeof d.width == 'undefined') || (typeof d.height == 'undefined')) {

        practicalWidth = this.noWdefaultWidth
        practicalHeight = this.noHdefaultHeight
        //console.log( "宽高是-->" + this.noWdefaultWidth, this.noHdefaultHeight );
      }
      // 垂直方向优先
      var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)

      var pc = this
      pc.ifr.style.display = 'none'
      pc.wb.style.display = 'none'
      //var img = document.getElementById('picture_one');
      img.style.marginLeft = ''
      img.style.marginTop = ''

      // 默认部署宽高与实际宽高一致
      var displayedWidth = practicalWidth
      var displayedHeight = practicalHeight

      if (pc.displayMode.isSuitableForWidth) {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

        if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
          img.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }
      } else if (pc.displayMode.isSuitableForWindow) {
        if (isVerticalDisplayedPriority) {
          displayedHeight = dpDisplayedHeight
          displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight

          img.style.marginLeft = ((dpDisplayedWidth - displayedWidth) / 2) + 'px'
        } else {

          displayedWidth = dpDisplayedWidth
          displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

          img.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }
      }
      img.style.width = displayedWidth + 'px'
      img.style.height = displayedHeight + 'px'
      img.style.display = 'block'
      this.db.reset(img)
    } else if (this.current.isWhiteBorad) {

      // 文档实际的宽和高
      var practicalWidth = d.width
      var practicalHeight = d.height

      // 垂直方向优先
      var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)

      var pc = this
      pc.ifr.style.display = 'none'
      img.style.display = 'none'

      var wb = pc.wb
      wb.style.display = 'block'
      wb.style.marginLeft = ''
      wb.style.marginTop = ''

      // 默认部署宽高与实际宽高一致
      var displayedWidth = practicalWidth
      var displayedHeight = practicalHeight
      if (pc.displayMode.isSuitableForWidth) {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

        if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
          wb.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }
      } else if (pc.displayMode.isSuitableForWindow) {
        if (isVerticalDisplayedPriority) {
          displayedHeight = dpDisplayedHeight
          displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight

          wb.style.marginLeft = ((dpDisplayedWidth - displayedWidth) / 2) + 'px'
        } else {
          displayedWidth = dpDisplayedWidth
          displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

          wb.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }
      }

      wb.style.width = displayedWidth + 'px'
      wb.style.height = displayedHeight + 'px'

      wb.width = displayedWidth * 2
      wb.height = displayedHeight * 2

      pc.wbContext.globalAlpha = 1
      pc.wbContext.fillStyle = '#FFF'
      pc.wbContext.fillRect(0, 0, wb.width, wb.height)

      pc.db.reset(wb)

    } else if (this.isDefaultImage) {
      this.showDefaultPageChange()
    }

    dp.db.resetDrawCurrentPage()
  }

  //翻页完成后的回调
  var lastPageDoc = ''
  PC.prototype.showAnimationPage = function (v) {
    //console.log('当前翻的页码是-->'+v.currentSlideIndex);
    this.ifr.style.visibility = ''
    var w = this.ifr.style.width
    var h = this.ifr.style.height
    if (this.current.isAnimationSlowMode) {
      // console.log("非极速动画翻页");
      if (typeof window.dpAnimateLoadComplete === 'function') {
        //console.log("222dp IOS 文档加载完成回调");
        window.dpAnimateLoadComplete(parseInt(w.toString().replace('px', '')), parseInt(h.toString().replace('px', '')))
      }
      if (window.android && typeof window.android.dpAnimateLoadComplete === 'function') {
        //console.log("222dp ANDROID 文档加载完成回调");
        window.android.dpAnimateLoadComplete(parseInt(w.toString().replace('px', '')), parseInt(h.toString().replace('px', '')))
      }
      try {
        window.webkit.messageHandlers.dpAnimateLoadComplete.postMessage({
          w: w,
          h: h
        })
      } catch (e) {

      }
      Utils.pmToParent({
        action: 'dpAnimateLoadComplete',
        width: parseInt(w.toString().replace('px', '')),
        height: parseInt(h.toString().replace('px', ''))
      })
    } else {
      //  console.log("极速动画翻页");
      if (lastPageDoc === this.current.docId) {
        return
      }
      // console.log("极速动画翻页成功回调");
      if (typeof window.dpAnimateLoadComplete === 'function') {//提供给ios回调
        //console.log("111dp IOS 文档加载完成回调");
        window.dpAnimateLoadComplete(parseInt(w.toString().replace('px', '')), parseInt(h.toString().replace('px', '')))

      }
      if (window.android && typeof window.android.dpAnimateLoadComplete === 'function') {//提供给android的回调
        //console.log("111dp ANDROID 文档加载完成回调");
        window.android.dpAnimateLoadComplete(parseInt(w.toString().replace('px', '')), parseInt(h.toString().replace('px', '')))
      }
      try {
        window.webkit.messageHandlers.dpAnimateLoadComplete.postMessage({
          w: w,
          h: h
        })
      } catch (e) {

      }

      Utils.pmToParent({
        action: 'dpAnimateLoadComplete',
        width: parseInt(w.toString().replace('px', '')),
        height: parseInt(h.toString().replace('px', ''))
      })
    }
    var pc = this
    this.wb.style.display = 'none'
    var img = document.getElementById('picture_one')
    img.style.display = 'none'
    var ifr = pc.ifr
    ifr.style.display = 'block'
    this.db.resetDrawCurrentPage()

  }
  /**
   * 显示白板
   * */
  PC.prototype.showWhiteBorad = function (d) {
    // 画板展示的宽和高
    var dpDisplayedWidth = window.innerWidth
    var dpDisplayedHeight = window.innerHeight

    // 文档实际的宽和高
    var practicalWidth = d.width
    var practicalHeight = d.height

    // 垂直方向优先
    var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)

    var pc = this
    pc.ifr.style.display = 'none'
    var img = document.getElementById('picture_one')
    img.style.display = 'none'
    var wb = pc.wb
    wb.style.display = 'block'
    wb.style.marginLeft = ''
    wb.style.marginTop = ''
    if (!wb) {
      try {
        window.webkit.messageHandlers.dpwhiteBoardError.postMessage({ error: 'whiteboard_error' })
      } catch (e) {
  
      }
      if (typeof  window.dpwhiteBoardError === 'function') {
        window.dpwhiteBoardError('whiteboard_error')
      }
      if (window.android && typeof  window.android.dpwhiteBoardError === 'function') {
        window.android.dpwhiteBoardError('whiteboard_error')
      }
      Utils.pmToParent({
        action: 'dpwhiteBoardComplete',
        error: 'whiteboard_error'
      })
    }
    // 默认部署宽高与实际宽高一致
    var displayedWidth = practicalWidth
    var displayedHeight = practicalHeight
    if (pc.displayMode.isSuitableForWidth) {
      displayedWidth = dpDisplayedWidth
      displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

      if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
        wb.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
      }
    } else if (pc.displayMode.isSuitableForWindow) {
      if (isVerticalDisplayedPriority) {
        displayedHeight = dpDisplayedHeight
        displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight

        wb.style.marginLeft = ((dpDisplayedWidth - displayedWidth) / 2) + 'px'
      } else {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

        wb.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
      }
    }

    wb.style.width = displayedWidth + 'px'
    wb.style.height = displayedHeight + 'px'

    wb.width = displayedWidth * 2
    wb.height = displayedHeight * 2

    pc.wbContext.globalAlpha = 1
    pc.wbContext.fillStyle = '#FFF'
    pc.wbContext.fillRect(0, 0, wb.width, wb.height)
    if (typeof  window.dpwhiteBoardComplete === 'function') {
      window.dpwhiteBoardComplete(d.width, d.height)
    }
    if (window.android && typeof  window.android.dpwhiteBoardComplete === 'function') {
      window.android.dpwhiteBoardComplete(displayedWidth, displayedHeight)
    }
    try {
      window.webkit.messageHandlers.dpwhiteBoardComplete.postMessage({w: d.width, h: d.height})
    } catch (e) {

    }


    Utils.pmToParent({
      action: 'dpwhiteBoardComplete',
      width: displayedWidth,
      height: displayedHeight
    }),
      // this.db.isCanDraw = true;
      this.clearDoc()
    pc.db.reset(wb)
    pc.db.resetDrawCurrentPage()
  }

  PC.prototype.clearDoc = function () {
    // var img = document.getElementById('picture_one');
    this.ifr.src = ''
    //this.img.src= "";
    lastPageDoc = ''
  }
  var imgeLoadComplete = false
  PC.prototype.showJPG = function (d, traceId) {
    var t = this
    imgeLoadComplete = false
    var lastImg = document.getElementById('picture_one')
    var img = creatImage(d.completeURI)

    //创建图片加载对象
    function creatImage(url) {
      var myImg = new Image()
      if (roomWatermark || parseInt(d.sign) === 1) {
        var url
        if (roomType === 'live') {
          url = 'https://live-watermark.csslcloud.net/watermark/sign/mark?roomId=' + roomid + '&accountId=' + accountid + '&hdToken=' + token + '&sign=' + d.sign + '&docId=' + d.docId +'&pageNo=' + d.pageNum
        } else {
          url = 'https://replay-watermark.csslcloud.net/watermark/sign/mark?roomId=' + roomid + '&accountId=' + accountid + '&hdToken=' + token + '&sign=' + d.sign + '&docId=' + d.docId +'&pageNo=' + d.pageNum
        }
        myImg.src = url + '&time=' + new Date().getTime()
      } else {
        if (openWaterMark) {
          var path = url + '?roomId=' + roomid + '&accountId=' + accountid + '&token=' + token + '&type=' + type
          if (parseInt(type, 10) === 2) {
            path += '&recordId=' + recordId
          }
          myImg.src = path.replace("image.","watermark.")
        } else {
          myImg.src = url
        }
      }
      myImg.style = 'z-index:10;display:none;'
      myImg.onerror = imageLoadError
      myImg.onload = imageLoadComplate
      return myImg
    }

    //图像加载失败
    function imageLoadError(e) {
      t.ccTrack({
        event: 'pageChangeEnd',
        code: 400,
        data: {
          url: d.completeURI,
          traceId: traceId,
          time: d.time,
          pageNum: d.pageNum,
          mode: d.mode,
          error: JSON.stringify(e)
        }
      })

      try {
        window.webkit.messageHandlers.loadImageError.postMessage({ url: d.completeURI, traceId: traceId })
      } catch (e) {

      }
      if (typeof window.dpImageLoadError === 'function') {
        window.dpImageLoadError(e)
      }
      //android端
      if (window.android && typeof window.android.dpImageLoadError === 'function') {
        window.android.dpImageLoadError(e)//android回调方法
      }
      //web端
      Utils.pmToParent({
        action: 'dpImageLoadError',
        error: e
      })
      img.onerror = null
      img.onload = null
      img = null
    }

    //图像加载完成调用函数
    function imageLoadComplate() {
      imgeLoadComplete = true
      // 画板展示的宽和高
      var dpDisplayedWidth = window.innerWidth
      var dpDisplayedHeight = window.innerHeight
      var imgRo = this.width / this.height
      var w = this.width
      var h = this.height
      // console.log('当前图片的宽高是-->' + w, h)
      if (typeof window.dpImageLoadComplete === 'function') {
        window.dpImageLoadComplete(w, h)
      }
      //android端
      if (window.android && typeof window.android.dpImageLoadComplete === 'function') {
        window.android.dpImageLoadComplete(displayedWidth, displayedHeight)//android回调方法
      }
      try {
        window.webkit.messageHandlers.dpImageLoadComplete.postMessage({w: w, h: h})
      } catch (e) {

      }
      var pc = t
      var imageBd = img
      if (pc.imgParentNode && lastImg) {
        pc.imgParentNode.removeChild(lastImg)
      }
      this.id = 'picture_one'
      pc.imgParentNode.appendChild(img)

      if (this.width > dpDisplayedWidth) {
        w = dpDisplayedWidth
        h = w / imgRo
      }
      if (imageBd.style.display != 'block') {
        pc.ifr.style.display = 'none'
        pc.wb.style.display = 'none'
        imageBd.style.display = 'block'
      }
      imageBd.width = w
      imageBd.height = h
      // 文档实际的宽和高
      var practicalWidth = d.width
      var practicalHeight = d.height
      if (parseInt(d.width, 10) == 0 || parseInt(d.height, 10) == 0 || (typeof d.width == 'undefined') || (typeof d.height == 'undefined')) {
        practicalWidth = w
        practicalHeight = h
        pc.noWdefaultWidth = w
        pc.noHdefaultHeight = h
      }
      // 垂直方向优先
      var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)
      imageBd.style.marginLeft = ''
      imageBd.style.marginTop = ''
      // 默认部署宽高与实际宽高一致
      var displayedWidth = practicalWidth
      var displayedHeight = practicalHeight

      if (pc.displayMode.isSuitableForWidth) {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

        if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
          imageBd.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }

      } else if (pc.displayMode.isSuitableForWindow) {

        if (isVerticalDisplayedPriority) {
          displayedHeight = dpDisplayedHeight
          displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight
          imageBd.style.marginLeft = ((dpDisplayedWidth - displayedWidth) / 2) + 'px'

        } else {
          displayedWidth = dpDisplayedWidth
          displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth
          imageBd.style.marginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
        }
      }

      imageBd.style.width = displayedWidth + 'px'
      imageBd.style.height = displayedHeight + 'px'

      pc.clearDoc()


      //web端
      Utils.pmToParent({
        action: 'dpImageLoadComplete',
        width: displayedWidth,
        height: displayedHeight
      })

      //this.db.isCanDraw = true;
      pc.db.reset(imageBd)
      pc.db.resetDrawCurrentPage()
    }
  }

  var isLoadingState = false // ppt是否buffering

  PC.prototype.dpIsBuffering = function (val) {
    if (val) {
      isLoadingState = val
    }
    console.log('isLoadingState:', val)
  }

  var isPageingState = false // ppt当前是否翻页
  var pageChangeTimer
  var isPageFinishEnd = true


  PC.prototype.showAnimation = function (d, traceId) {

    // 画板展示的宽和高
    var dpDisplayedWidth = window.innerWidth
    var dpDisplayedHeight = window.innerHeight

    // 文档实际的宽和高
    var practicalWidth = d.width
    var practicalHeight = d.height

    // 垂直方向优先
    var isVerticalDisplayedPriority = (dpDisplayedWidth / dpDisplayedHeight) > (practicalWidth / practicalHeight)

    var pc = this

    var ifr = pc.ifr

    pc.currentPageNum = d.pageNum // 当前页赋值 修复动画丢失

    // ifr.style.marginTop = '';
    // ifr.style.marginLeft = '';

    // 默认部署宽高与实际宽高一致
    var displayedWidth = practicalWidth
    var displayedHeight = practicalHeight
    var displayedMarginTop = 0
    var displayedMarginLeft = 0

    if (pc.displayMode.isSuitableForWidth) {
      displayedWidth = dpDisplayedWidth
      displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth

      if (pc.displayMode.isVerticalCenter && displayedHeight < dpDisplayedHeight) {
        displayedMarginTop = ((dpDisplayedHeight - displayedHeight) / 2) + 'px'
      }
    } else if (pc.displayMode.isSuitableForWindow) {
      if (isVerticalDisplayedPriority) {
        displayedHeight = dpDisplayedHeight
        displayedWidth = dpDisplayedHeight * practicalWidth / practicalHeight
        displayedMarginLeft = (dpDisplayedWidth - displayedWidth) / 2
      } else {
        displayedWidth = dpDisplayedWidth
        displayedHeight = dpDisplayedWidth * practicalHeight / practicalWidth
        displayedMarginTop = (dpDisplayedHeight - displayedHeight) / 2
      }
    }

    if (displayedMarginTop >= 0) {
      ifr.style.marginTop = displayedMarginTop + 'px'
      // this.ifrMT=displayedMarginTop + 'px';
    }
    if (displayedMarginLeft >= 0) {
      ifr.style.marginLeft = displayedMarginLeft + 'px'
      //this.ifrML = displayedMarginLeft + 'px';
    }
    ifr.style.width = displayedWidth + 'px'
    ifr.style.height = displayedHeight + 'px'
    pc.db.reset(ifr)

    var u = pc.current.completeURI

    var us = u.split('?')
    var ifs = ifr.src.split('?')
    if (ifs == '') {
      ifr.style.display = 'block'
    }
    ifr.onerror = function (e) {
      pc.ccTrack({
        event: 'pageChangeEnd',
        code: 400,
        data: {
          url: ifr.src,
          traceId: traceId,
          pageNum: d.pageNum,
          mode: d.mode,
          error: JSON.stringify(e)
        }
      })

      try {
        var _obj = {}
        if (ifr.src) _obj.url = ifr.src
        if (traceId) _obj.traceId = traceId
        window.webkit.messageHandlers.dpAnimateLoadError.postMessage(_obj)
      } catch (e) {

      }

      if (typeof window.dpAnimateLoadError === 'function') {//提供给ios回调
        window.dpAnimateLoadError(e)

      }
      if (window.android && typeof window.android.dpAnimateLoadError === 'function') {//提供给android的回调
        window.android.dpAnimateLoadError(e)
      }
      Utils.pmToParent({
        action: 'dpAnimateLoadError',
        error: e
      })
    }
    // pc.currentPageNum = d.pageNum
    //极速动画
    var waitingPageChange = function () {
      if (u && d.mode == 2 && ifs[0] === us[0]) {
        Utils.pmToIfr({
          action: 'page_change',
          pagenum: d.pageNum
        })
        pc.wb.style.display = 'none'
        pc.img.style.display = 'none'
        ifr.style.display = 'block'
        pc.current.isReadyTriggerAnimation = true//解决从图片切换至当前动画页时切换下个动画无效。
      } else if (u && d.mode == 1 && u == ifr.src) {
        Utils.pmToIfr({
          action: 'animation_change',
          step: 0
        })
        pc.wb.style.display = 'none'
        pc.img.style.display = 'none'
        ifr.style.display = 'block'
        pc.current.isReadyTriggerAnimation = true//解决从图片切换至当前动画页时切换下个动画无效。
      }
    }
    var diguiIsLoadingState = function () {
      if (u && d.mode == 2 && ifs[0] === us[0]) { // 后续翻页
        if (!isLoadingState) {
          isPageFinishEnd = true
          isPageingState = true
          if (pc.currentPageNum === d.pageNum) {
            isPageingState = false
          }
          waitingPageChange()
        } else {
          pageChangeTimer = setTimeout (function () { // 延迟500ms 递归
            diguiIsLoadingState()
          }, 500)
        }
      } else { // 第一次翻页
        pc.clearDoc()
        ifr.setAttribute('src', pc.changeURLArg(u, 'dpVersion', dpVersion))
        isLoadingState = true
      }
    }

    if (isLoadingState) {
      isPageFinishEnd = false
    }
    if (pc.currentPageNum !== d.pageNum) {
      clearTimeout (animationTimer)
      animationTimer = null
    }

    diguiIsLoadingState()
  }

  PC.prototype.changeURLArg = function (url,arg,arg_val){
    var pattern=arg+'=([^&]*)';
    var replaceText=arg+'='+arg_val; 
    if(url.match(pattern)){
        var tmp='/('+ arg+'=)([^&]*)/gi';
        tmp=url.replace(eval(tmp),replaceText);
        return tmp;
    }else{ 
        if(url.match('[\?]')){ 
            return url+'&'+replaceText; 
        }else{ 
            return url+'?'+replaceText; 
        } 
    }
  }

  //设置文档样式
  PC.prototype.setDocCss = function (d) {
    var style = document.createElement('style')
    style.type = 'text/css'
    var text = '#dp{' + d + '}'
    style.innerHTML = text
    var head = document.getElementsByTagName('head')[0]
    head.appendChild(style)
  }

  var currentPage = 'whiteBorad' // 当前翻页类型

  PC.prototype.getCurrentPageType = function () {
    return currentPage
  }

  PC.prototype.pageChange = function (d, traceId) {
    this.ccTrack({
      event: 'pageChangeStart',
      code: 200,
      data: {
        currentData: d,
        traceId: traceId
      }
    })

    // if(this.current.docId === d.docId && this.current.pageNum === d.pageNum){
    //   if (d.isAnimation) {
    //     this.ifr.style.display = 'block'
    //   }
    //   return
    // }
    this.current = d
    this.isLoaded = false
    if (d.isWhiteBorad) {
      currentPage = 'whiteBorad'
      this.showWhiteBorad(d)
    } else if (d.isJpg) {
      currentPage = 'jpg'
      this.showJPG(d, traceId)
    } else if (d.isAnimation) {
      this.ifr.style.display = 'block'
      currentPage = 'animation'
      this.showAnimation(d, traceId)
    }

    // this.db.resetDrawCurrentPage();
  }

  PC.prototype.clear = function () {
    this.ifr.style.display = 'none'
    this.img.style.display = 'none'
    this.wb.style.display = 'none'
  }

  // 实例化画板对象
  window.PC = PC

})(window, document, undefined)