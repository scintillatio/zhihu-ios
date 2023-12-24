// generate by Venom, do not edit manually.

#import "ZHModuleVideoClipLocalizedStrings.h"

@implementation ZHModuleVideoClipLocalizedStrings


+ (NSBundle *)bundle {
    // xx.app/
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];

    // xx.app/ZHModuleVideoClipResource.bundle/
    NSString *bundlePath = [bundle pathForResource:@"ZHModuleVideoClipResource" ofType:@"bundle"];
    if (!bundlePath) {
        return nil;
    }

    // debug
    bundle = [NSBundle bundleWithPath:bundlePath];
    return bundle;

    
}



/// hint: 应用到全部
+ (NSString *)applyAll {
    return NSLocalizedStringFromTableInBundle(@"applyAll", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 变速变调
+ (NSString *)keepAudioPitch {
    return NSLocalizedStringFromTableInBundle(@"keepAudioPitch", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 全部
+ (NSString *)album_all {
    return NSLocalizedStringFromTableInBundle(@"album.all", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 视频
+ (NSString *)album_video {
    return NSLocalizedStringFromTableInBundle(@"album.video", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 图片
+ (NSString *)album_image {
    return NSLocalizedStringFromTableInBundle(@"album.image", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 开始制作
+ (NSString *)album_startmake {
    return NSLocalizedStringFromTableInBundle(@"album.startmake", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 提示
+ (NSString *)album_Tips {
    return NSLocalizedStringFromTableInBundle(@"album.Tips", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 知道了
+ (NSString *)album_Know {
    return NSLocalizedStringFromTableInBundle(@"album.Know", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 素材选择
+ (NSString *)album_selectAssets {
    return NSLocalizedStringFromTableInBundle(@"album.selectAssets", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 选择图片
+ (NSString *)album_selectImage {
    return NSLocalizedStringFromTableInBundle(@"album.selectImage", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 选择视频
+ (NSString *)album_selectVideo {
    return NSLocalizedStringFromTableInBundle(@"album.selectVideo", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 选择内容
+ (NSString *)album_selectContent {
    return NSLocalizedStringFromTableInBundle(@"album.selectContent", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已选择
+ (NSString *)album_select {
    return NSLocalizedStringFromTableInBundle(@"album.select", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已选%ld项
+ (NSString *)album_selectNum {
    return NSLocalizedStringFromTableInBundle(@"album.selectNum", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 暂不支持hdr素材编辑
+ (NSString *)album_unsupportHDR {
    return NSLocalizedStringFromTableInBundle(@"album.unsupportHDR", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 设备暂不支持4K素材编辑
+ (NSString *)album_unsupport4K {
    return NSLocalizedStringFromTableInBundle(@"album.unsupport4K", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 仅支持图片导入
+ (NSString *)album_onlySupportImage {
    return NSLocalizedStringFromTableInBundle(@"album.onlySupportImage", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 视频片段过短
+ (NSString *)album_videoDurationLower {
    return NSLocalizedStringFromTableInBundle(@"album.videoDurationLower", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 仅支持视频导入
+ (NSString *)album_onlySupportVideo {
    return NSLocalizedStringFromTableInBundle(@"album.onlySupportVideo", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 资源在iCloud
+ (NSString *)album_assetFromiCloud {
    return NSLocalizedStringFromTableInBundle(@"album.assetFromiCloud", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 是否要开始下载
+ (NSString *)album_download {
    return NSLocalizedStringFromTableInBundle(@"album.download", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 取消
+ (NSString *)album_cancel {
    return NSLocalizedStringFromTableInBundle(@"album.cancel", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 确定
+ (NSString *)album_ok {
    return NSLocalizedStringFromTableInBundle(@"album.ok", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 正在下载
+ (NSString *)album_loadingIndex {
    return NSLocalizedStringFromTableInBundle(@"album.loadingIndex", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 加载中...
+ (NSString *)album_loading {
    return NSLocalizedStringFromTableInBundle(@"album.loading", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 反全选
+ (NSString *)album_deselectall {
    return NSLocalizedStringFromTableInBundle(@"album.deselectall", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 今天
+ (NSString *)album_today {
    return NSLocalizedStringFromTableInBundle(@"album.today", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 全选
+ (NSString *)album_selectall {
    return NSLocalizedStringFromTableInBundle(@"album.selectall", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 标记相同的颜色片段将自动填入相同的内容
+ (NSString *)album_templateTip {
    return NSLocalizedStringFromTableInBundle(@"album.templateTip", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 选择%ld个片段
+ (NSString *)album_album_templateClips {
    return NSLocalizedStringFromTableInBundle(@"album.album.templateClips", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 下一步
+ (NSString *)album_album_next {
    return NSLocalizedStringFromTableInBundle(@"album.album.next", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 片段
+ (NSString *)album_duration {
    return NSLocalizedStringFromTableInBundle(@"album.duration", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 最优
+ (NSString *)album_bestDuration {
    return NSLocalizedStringFromTableInBundle(@"album.bestDuration", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已导入
+ (NSString *)album_imported {
    return NSLocalizedStringFromTableInBundle(@"album.imported", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 选择制作比例
+ (NSString *)selectAspectRatio {
    return NSLocalizedStringFromTableInBundle(@"selectAspectRatio", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 默认·		
+ (NSString *)nv_default {
    return NSLocalizedStringFromTableInBundle(@"nv.default", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 编辑
+ (NSString *)item_edit {
    return NSLocalizedStringFromTableInBundle(@"item.edit", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 滤镜
+ (NSString *)item_filter {
    return NSLocalizedStringFromTableInBundle(@"item.filter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 特效
+ (NSString *)item_effect {
    return NSLocalizedStringFromTableInBundle(@"item.effect", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 贴纸
+ (NSString *)item_sticker {
    return NSLocalizedStringFromTableInBundle(@"item.sticker", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 文字
+ (NSString *)item_caption {
    return NSLocalizedStringFromTableInBundle(@"item.caption", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 智能字幕
+ (NSString *)item_autoCaption {
    return NSLocalizedStringFromTableInBundle(@"item.autoCaption", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 字幕模板
+ (NSString *)item_captionTemplate {
    return NSLocalizedStringFromTableInBundle(@"item.captionTemplate", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 水印
+ (NSString *)item_watermark {
    return NSLocalizedStringFromTableInBundle(@"item.watermark", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音频
+ (NSString *)item_audio {
    return NSLocalizedStringFromTableInBundle(@"item.audio", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 录音
+ (NSString *)item_record {
    return NSLocalizedStringFromTableInBundle(@"item.record", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 画中画
+ (NSString *)item_pip {
    return NSLocalizedStringFromTableInBundle(@"item.pip", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 删除
+ (NSString *)item_delete {
    return NSLocalizedStringFromTableInBundle(@"item.delete", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 背景
+ (NSString *)item_background {
    return NSLocalizedStringFromTableInBundle(@"item.background", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 调节
+ (NSString *)item_adjust {
    return NSLocalizedStringFromTableInBundle(@"item.adjust", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 比例
+ (NSString *)item_ratio {
    return NSLocalizedStringFromTableInBundle(@"item.ratio", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 标注
+ (NSString *)item_mark {
    return NSLocalizedStringFromTableInBundle(@"item.mark", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 新增特效
+ (NSString *)item_addEffect {
    return NSLocalizedStringFromTableInBundle(@"item.addEffect", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 自定义特技
+ (NSString *)item_addPlugFx {
    return NSLocalizedStringFromTableInBundle(@"item.addPlugFx", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 新增滤镜
+ (NSString *)item_addFilter {
    return NSLocalizedStringFromTableInBundle(@"item.addFilter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 新增调节
+ (NSString *)item_addAdjust {
    return NSLocalizedStringFromTableInBundle(@"item.addAdjust", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加贴纸
+ (NSString *)item_addSticker {
    return NSLocalizedStringFromTableInBundle(@"item.addSticker", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加文字
+ (NSString *)item_addCaption {
    return NSLocalizedStringFromTableInBundle(@"item.addCaption", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 智能字幕
+ (NSString *)item_addVideoCaption {
    return NSLocalizedStringFromTableInBundle(@"item.addVideoCaption", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 效果
+ (NSString *)item_addEffectmark {
    return NSLocalizedStringFromTableInBundle(@"item.addEffectmark", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 新增画中画
+ (NSString *)item_addPIP {
    return NSLocalizedStringFromTableInBundle(@"item.addPIP", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音乐
+ (NSString *)item_addMusic {
    return NSLocalizedStringFromTableInBundle(@"item.addMusic", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 录音
+ (NSString *)item_addRecording {
    return NSLocalizedStringFromTableInBundle(@"item.addRecording", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 提取
+ (NSString *)item_addExtract {
    return NSLocalizedStringFromTableInBundle(@"item.addExtract", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 画布颜色
+ (NSString *)item_addCanvasColor {
    return NSLocalizedStringFromTableInBundle(@"item.addCanvasColor", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 画布样式
+ (NSString *)item_addCanvasStyle {
    return NSLocalizedStringFromTableInBundle(@"item.addCanvasStyle", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 画布模糊
+ (NSString *)item_addCanvasBlur {
    return NSLocalizedStringFromTableInBundle(@"item.addCanvasBlur", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 原始
+ (NSString *)item_origin {
    return NSLocalizedStringFromTableInBundle(@"item.origin", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 分割
+ (NSString *)item_split {
    return NSLocalizedStringFromTableInBundle(@"item.split", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 变速
+ (NSString *)item_speed {
    return NSLocalizedStringFromTableInBundle(@"item.speed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音量
+ (NSString *)item_volume {
    return NSLocalizedStringFromTableInBundle(@"item.volume", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 复制
+ (NSString *)item_copy {
    return NSLocalizedStringFromTableInBundle(@"item.copy", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 转场
+ (NSString *)item_transition {
    return NSLocalizedStringFromTableInBundle(@"item.transition", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 变声
+ (NSString *)item_voiceFx {
    return NSLocalizedStringFromTableInBundle(@"item.voiceFx", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 切画中画
+ (NSString *)item_changeRolePip {
    return NSLocalizedStringFromTableInBundle(@"item.changeRolePip", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 切主轨道
+ (NSString *)item_changeRoleMain {
    return NSLocalizedStringFromTableInBundle(@"item.changeRoleMain", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 混合模式
+ (NSString *)item_blendMode {
    return NSLocalizedStringFromTableInBundle(@"item.blendMode", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 替换
+ (NSString *)item_replace {
    return NSLocalizedStringFromTableInBundle(@"item.replace", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 智能抠像
+ (NSString *)item_smartMatting {
    return NSLocalizedStringFromTableInBundle(@"item.smartMatting", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 色度抠像
+ (NSString *)item_colorMatting {
    return NSLocalizedStringFromTableInBundle(@"item.colorMatting", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 蒙版
+ (NSString *)item_mask {
    return NSLocalizedStringFromTableInBundle(@"item.mask", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 动画
+ (NSString *)item_animation {
    return NSLocalizedStringFromTableInBundle(@"item.animation", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 调节
+ (NSString *)item_ajust {
    return NSLocalizedStringFromTableInBundle(@"item.ajust", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 透明度
+ (NSString *)item_alpha {
    return NSLocalizedStringFromTableInBundle(@"item.alpha", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 旋转
+ (NSString *)item_rotation {
    return NSLocalizedStringFromTableInBundle(@"item.rotation", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 裁切
+ (NSString *)item_crop {
    return NSLocalizedStringFromTableInBundle(@"item.crop", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 镜像
+ (NSString *)item_mirror {
    return NSLocalizedStringFromTableInBundle(@"item.mirror", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 美颜
+ (NSString *)item_beauty {
    return NSLocalizedStringFromTableInBundle(@"item.beauty", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 人脸道具
+ (NSString *)item_ARScene {
    return NSLocalizedStringFromTableInBundle(@"item.ARScene", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 常规变速
+ (NSString *)item_normalSpeed {
    return NSLocalizedStringFromTableInBundle(@"item.normalSpeed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 曲线变速
+ (NSString *)item_curveSpeed {
    return NSLocalizedStringFromTableInBundle(@"item.curveSpeed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 倒放
+ (NSString *)item_revert {
    return NSLocalizedStringFromTableInBundle(@"item.revert", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 定格
+ (NSString *)item_Freeze {
    return NSLocalizedStringFromTableInBundle(@"item.Freeze", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 铺满
+ (NSString *)item_overspread {
    return NSLocalizedStringFromTableInBundle(@"item.overspread", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音效
+ (NSString *)item_audioFx {
    return NSLocalizedStringFromTableInBundle(@"item.audioFx", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 样式
+ (NSString *)item_style {
    return NSLocalizedStringFromTableInBundle(@"item.style", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 替换特效
+ (NSString *)item_replaceEffect {
    return NSLocalizedStringFromTableInBundle(@"item.replaceEffect", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 替换滤镜
+ (NSString *)item_replaceFilter {
    return NSLocalizedStringFromTableInBundle(@"item.replaceFilter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 替换调节
+ (NSString *)item_replaceAdjust {
    return NSLocalizedStringFromTableInBundle(@"item.replaceAdjust", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 确认
+ (NSString *)button_confirm {
    return NSLocalizedStringFromTableInBundle(@"button.confirm", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 取消
+ (NSString *)button_cancel {
    return NSLocalizedStringFromTableInBundle(@"button.cancel", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 拖动或双指缩放调整画面
+ (NSString *)label_cropperTip {
    return NSLocalizedStringFromTableInBundle(@"label.cropperTip", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 请不要锁屏或切换到其他的应用程序
+ (NSString *)label_stayHere {
    return NSLocalizedStringFromTableInBundle(@"label.stayHere", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: File size is approximately
+ (NSString *)label_fileSizeLimmit {
    return NSLocalizedStringFromTableInBundle(@"label.fileSizeLimmit", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 分辨率
+ (NSString *)label_resolution {
    return NSLocalizedStringFromTableInBundle(@"label.resolution", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 分辨率越高，视频越清晰
+ (NSString *)label_resolutionHigher {
    return NSLocalizedStringFromTableInBundle(@"label.resolutionHigher", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 帧率
+ (NSString *)label_fps {
    return NSLocalizedStringFromTableInBundle(@"label.fps", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 帧率越高，视频的平滑度越高
+ (NSString *)label_fpsHigher {
    return NSLocalizedStringFromTableInBundle(@"label.fpsHigher", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 推荐
+ (NSString *)label_recommend {
    return NSLocalizedStringFromTableInBundle(@"label.recommend", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已保存到相册和草稿
+ (NSString *)label_saveDraft {
    return NSLocalizedStringFromTableInBundle(@"label.saveDraft", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: HDR Settings
+ (NSString *)label_hdrSettings {
    return NSLocalizedStringFromTableInBundle(@"label.hdrSettings", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: Export format HEVC
+ (NSString *)label_exportFormatHEVC {
    return NSLocalizedStringFromTableInBundle(@"label.exportFormatHEVC", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: Export configuration
+ (NSString *)label_exportConfiguration {
    return NSLocalizedStringFromTableInBundle(@"label.exportConfiguration", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 确定
+ (NSString *)alert_done {
    return NSLocalizedStringFromTableInBundle(@"alert.done", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 取消
+ (NSString *)alert_cancel {
    return NSLocalizedStringFromTableInBundle(@"alert.cancel", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 倒放中
+ (NSString *)hud_upend {
    return NSLocalizedStringFromTableInBundle(@"hud.upend", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 转码中...
+ (NSString *)toast_convertor {
    return NSLocalizedStringFromTableInBundle(@"toast.convertor", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 不支持倒放
+ (NSString *)toast_notSupportUpend {
    return NSLocalizedStringFromTableInBundle(@"toast.notSupportUpend", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 当前位置不可分割
+ (NSString *)toast_indivisibleCutPosition {
    return NSLocalizedStringFromTableInBundle(@"toast.indivisibleCutPosition", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 轨道至少保留一个素材
+ (NSString *)toast_leastOneMaterial {
    return NSLocalizedStringFromTableInBundle(@"toast.leastOneMaterial", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 不支持定格
+ (NSString *)toast_notSupportStaticFrame {
    return NSLocalizedStringFromTableInBundle(@"toast.notSupportStaticFrame", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 加载片段错误
+ (NSString *)toast_loadClipError {
    return NSLocalizedStringFromTableInBundle(@"toast.loadClipError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 定格时间错误
+ (NSString *)toast_freezeFrameTimeError {
    return NSLocalizedStringFromTableInBundle(@"toast.freezeFrameTimeError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: sdk版本不支持智能抠像
+ (NSString *)toast_unSupportMatting {
    return NSLocalizedStringFromTableInBundle(@"toast.unSupportMatting", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 无可用空间
+ (NSString *)toast_unusableSpace {
    return NSLocalizedStringFromTableInBundle(@"toast.unusableSpace", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 贴纸音效已开启
+ (NSString *)toast_stickerSoundIsOn {
    return NSLocalizedStringFromTableInBundle(@"toast.stickerSoundIsOn", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 贴纸音效已关闭
+ (NSString *)toast_stickerSoundIsOff {
    return NSLocalizedStringFromTableInBundle(@"toast.stickerSoundIsOff", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加音频失败
+ (NSString *)toast_addAudioFailure {
    return NSLocalizedStringFromTableInBundle(@"toast.addAudioFailure", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 倒放失败
+ (NSString *)toast_upendError {
    return NSLocalizedStringFromTableInBundle(@"toast.upendError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 导出失败
+ (NSString *)toast_importFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.importFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 打包出错
+ (NSString *)toast_compileError {
    return NSLocalizedStringFromTableInBundle(@"toast.compileError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 画中画轨道数已达上限
+ (NSString *)toast_pipTrackLimit {
    return NSLocalizedStringFromTableInBundle(@"toast.pipTrackLimit", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 语音识别中
+ (NSString *)toast_speechRecognitioning {
    return NSLocalizedStringFromTableInBundle(@"toast.speechRecognitioning", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 草稿保存失败
+ (NSString *)toast_saveError {
    return NSLocalizedStringFromTableInBundle(@"toast.saveError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 撤销：智能抠像
+ (NSString *)toast_undoSmartMatting {
    return NSLocalizedStringFromTableInBundle(@"toast.undoSmartMatting", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 更新封面失败
+ (NSString *)toast_updateVideoCoverFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.updateVideoCoverFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 提取失败
+ (NSString *)toast_retrievalFailure {
    return NSLocalizedStringFromTableInBundle(@"toast.retrievalFailure", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音频加载出错
+ (NSString *)toast_audioLoadingError {
    return NSLocalizedStringFromTableInBundle(@"toast.audioLoadingError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已取消
+ (NSString *)toast_cancelled {
    return NSLocalizedStringFromTableInBundle(@"toast.cancelled", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 素材安装失败
+ (NSString *)toast_materialInstallationFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.materialInstallationFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 已应用到全部片段
+ (NSString *)toast_applyedAll {
    return NSLocalizedStringFromTableInBundle(@"toast.applyedAll", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加调节失败
+ (NSString *)toast_addAdjustsFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.addAdjustsFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 时场过短不能添加转场
+ (NSString *)toast_transitionDurationLest {
    return NSLocalizedStringFromTableInBundle(@"toast.transitionDurationLest", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 正在识别，请稍后
+ (NSString *)toast_iFlying {
    return NSLocalizedStringFromTableInBundle(@"toast.iFlying", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 识别失败，请检查网络
+ (NSString *)toast_identificationFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.identificationFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 请开启音量或者添加音频
+ (NSString *)toast_noRecognitionSource {
    return NSLocalizedStringFromTableInBundle(@"toast.noRecognitionSource", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 当前片段不可调整
+ (NSString *)toast_notAdjustableFragment {
    return NSLocalizedStringFromTableInBundle(@"toast.notAdjustableFragment", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 当前位置已有特效
+ (NSString *)toast_hadEffect {
    return NSLocalizedStringFromTableInBundle(@"toast.hadEffect", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加特效失败
+ (NSString *)toast_addEffectsFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.addEffectsFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 当前位置已有滤镜
+ (NSString *)toast_hadFilter {
    return NSLocalizedStringFromTableInBundle(@"toast.hadFilter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 添加滤镜失败
+ (NSString *)toast_addFiltersFailed {
    return NSLocalizedStringFromTableInBundle(@"toast.addFiltersFailed", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 录音出错
+ (NSString *)toast_recordError {
    return NSLocalizedStringFromTableInBundle(@"toast.recordError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 当前位置不可添加录音
+ (NSString *)toast_recordTimeError {
    return NSLocalizedStringFromTableInBundle(@"toast.recordTimeError", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 录音太短
+ (NSString *)toast_tapeTooShort {
    return NSLocalizedStringFromTableInBundle(@"toast.tapeTooShort", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 媒体库权限被禁止
+ (NSString *)toast_banMediaPermissions {
    return NSLocalizedStringFromTableInBundle(@"toast.banMediaPermissions", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 普通
+ (NSString *)sticker_nomal {
    return NSLocalizedStringFromTableInBundle(@"sticker.nomal", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 有声
+ (NSString *)sticker_voice {
    return NSLocalizedStringFromTableInBundle(@"sticker.voice", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 自定义
+ (NSString *)sticker_custom {
    return NSLocalizedStringFromTableInBundle(@"sticker.custom", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 请输入文字
+ (NSString *)caption_placeholder {
    return NSLocalizedStringFromTableInBundle(@"caption.placeholder", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 花字模板
+ (NSString *)caption_context {
    return NSLocalizedStringFromTableInBundle(@"caption.context", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 样式
+ (NSString *)caption_style {
    return NSLocalizedStringFromTableInBundle(@"caption.style", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 花字
+ (NSString *)caption_render {
    return NSLocalizedStringFromTableInBundle(@"caption.render", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 气泡
+ (NSString *)caption_bubble {
    return NSLocalizedStringFromTableInBundle(@"caption.bubble", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 动画
+ (NSString *)caption_animation {
    return NSLocalizedStringFromTableInBundle(@"caption.animation", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 入场动画
+ (NSString *)caption_animation_enter {
    return NSLocalizedStringFromTableInBundle(@"caption.animation.enter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 出场动画
+ (NSString *)caption_animation_out {
    return NSLocalizedStringFromTableInBundle(@"caption.animation.out", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 循环动画
+ (NSString *)caption_animation_loop {
    return NSLocalizedStringFromTableInBundle(@"caption.animation.loop", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 无
+ (NSString *)caption_animation_no {
    return NSLocalizedStringFromTableInBundle(@"caption.animation.no", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 文本
+ (NSString *)caption_text {
    return NSLocalizedStringFromTableInBundle(@"caption.text", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 描边
+ (NSString *)caption_stroke {
    return NSLocalizedStringFromTableInBundle(@"caption.stroke", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 背景
+ (NSString *)caption_background {
    return NSLocalizedStringFromTableInBundle(@"caption.background", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 排列
+ (NSString *)caption_align {
    return NSLocalizedStringFromTableInBundle(@"caption.align", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 粗斜体
+ (NSString *)caption_boldItalic {
    return NSLocalizedStringFromTableInBundle(@"caption.boldItalic", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 不透明度
+ (NSString *)caption_opacity {
    return NSLocalizedStringFromTableInBundle(@"caption.opacity", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 快
+ (NSString *)caption_fast {
    return NSLocalizedStringFromTableInBundle(@"caption.fast", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 慢
+ (NSString *)caption_slow {
    return NSLocalizedStringFromTableInBundle(@"caption.slow", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 宽度
+ (NSString *)caption_width {
    return NSLocalizedStringFromTableInBundle(@"caption.width", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 圆角
+ (NSString *)caption_radius {
    return NSLocalizedStringFromTableInBundle(@"caption.radius", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 字间距
+ (NSString *)caption_wordSpace {
    return NSLocalizedStringFromTableInBundle(@"caption.wordSpace", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 行间距
+ (NSString *)caption_lineSpace {
    return NSLocalizedStringFromTableInBundle(@"caption.lineSpace", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音量
+ (NSString *)edit_volume {
    return NSLocalizedStringFromTableInBundle(@"edit.volume", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 音频转场
+ (NSString *)edit_audioTransitions {
    return NSLocalizedStringFromTableInBundle(@"edit.audioTransitions", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 淡入时长
+ (NSString *)edit_fadeIn {
    return NSLocalizedStringFromTableInBundle(@"edit.fadeIn", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 淡出时长
+ (NSString *)edit_fadeOut {
    return NSLocalizedStringFromTableInBundle(@"edit.fadeOut", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 美肤
+ (NSString *)edit_beauty {
    return NSLocalizedStringFromTableInBundle(@"edit.beauty", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 美型
+ (NSString *)edit_beautifulType {
    return NSLocalizedStringFromTableInBundle(@"edit.beautifulType", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 重置
+ (NSString *)edit_reset {
    return NSLocalizedStringFromTableInBundle(@"edit.reset", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 磨皮
+ (NSString *)edit_moulting {
    return NSLocalizedStringFromTableInBundle(@"edit.moulting", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 美白
+ (NSString *)edit_whitening {
    return NSLocalizedStringFromTableInBundle(@"edit.whitening", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 红润
+ (NSString *)edit_ruddy {
    return NSLocalizedStringFromTableInBundle(@"edit.ruddy", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 瘦脸
+ (NSString *)edit_thinFace {
    return NSLocalizedStringFromTableInBundle(@"edit.thinFace", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 大眼
+ (NSString *)edit_BigEye {
    return NSLocalizedStringFromTableInBundle(@"edit.BigEye", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 下巴
+ (NSString *)edit_chin {
    return NSLocalizedStringFromTableInBundle(@"edit.chin", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 额头
+ (NSString *)edit_forehead {
    return NSLocalizedStringFromTableInBundle(@"edit.forehead", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 瘦鼻
+ (NSString *)edit_ThinNose {
    return NSLocalizedStringFromTableInBundle(@"edit.ThinNose", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 嘴型
+ (NSString *)edit_Lips {
    return NSLocalizedStringFromTableInBundle(@"edit.Lips", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 开启美型
+ (NSString *)edit_openBeautyType {
    return NSLocalizedStringFromTableInBundle(@"edit.openBeautyType", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 关闭美型
+ (NSString *)edit_closeBeautyType {
    return NSLocalizedStringFromTableInBundle(@"edit.closeBeautyType", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 入场
+ (NSString *)animation_enter {
    return NSLocalizedStringFromTableInBundle(@"animation.enter", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 出场
+ (NSString *)animation_out {
    return NSLocalizedStringFromTableInBundle(@"animation.out", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 循环
+ (NSString *)animation_loop {
    return NSLocalizedStringFromTableInBundle(@"animation.loop", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}

/// hint: 图片模板
+ (NSString *)item_image_template {
    return NSLocalizedStringFromTableInBundle(@"item.image.template", @"ZHModuleVideoClipLocalizedStrings", [self bundle], ) ?: @"";
}


@end

