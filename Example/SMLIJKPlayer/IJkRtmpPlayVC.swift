//
//  IJkRtmpPlayVC.swift
//  SMLIJKPlayer
//
//  Created by SongMengLong on 2022/12/29.
//

import UIKit
import IJKMediaFramework

class IJkRtmpPlayVC: UIViewController {
    /// 底层播放画面View
    private lazy var playView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    /// 播放画面上工具View
    private lazy var toolView: MonitorToolView = {
        let view = MonitorToolView()
        view.backgroundColor = UIColor.clear
        // 设置代理
        view.delegate = self
        return view
    }()
    /// 是否已经播放
    private var didConnect: Bool = false
    /// 厂商标识
    private var vendor: String = String()
    /// 设备数据信息
//    var device: CameraListData = CameraListData()
    /// 是否已经退出
    private var didDisappear: Bool = false
        
    private var serverIp: String = String()
    
    private var player: IJKMediaPlayback? // = IJKMediaPlayback()
        
    /// 页面即将出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.player?.prepareToPlay()
        
        // 添加loading
//        ProgressHUD.showMessage(NSLocalizedString("正在加载", comment: ""))
        // 没有播放的状态返回时 延时20s消失hud
                
    }
    
    /// 页面已经加载
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("云监控", comment: "")
        // 背景颜色设置为黑色
        self.view.backgroundColor = UIColor.black
        // 设置子控件
        self.setupSubViews()
        
        IJKFFMoviePlayerController.setLogReport(true)
        IJKFFMoviePlayerController.setLogLevel(k_IJK_LOG_DEBUG)
        IJKFFMoviePlayerController.checkIfFFmpegVersionMatch(true)

        
        let options = IJKFFOptions.byDefault()
        
        let previewUrl: URL = URL(string: "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8")!
//        let previewUrl = Bundle.main.url(forResource: "230105", withExtension: "mp4")
//        let previewUrl = Bundle.main.url(forResource: "8904", withExtension: "mp4")
        self.player = IJKFFMoviePlayerController(contentURL: previewUrl, with: options)
                
        self.player?.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.player?.view.frame = self.playView.bounds
        self.player?.scalingMode = IJKMPMovieScalingMode.aspectFit
        self.player?.shouldAutoplay = true

        self.playView.autoresizesSubviews = true
        self.playView.addSubview((self.player?.view)!)
    }
    
    /// 页面即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.didDisappear = true
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.player?.shutdown()
    }
    
    /// 判断监控器状态
    private func phoneObtainCameraRequest(ip: String) -> Void {
    }
}

extension IJkRtmpPlayVC: MonitorToolDelegate {
    
    /// 播放按钮的动作方法
    func playBtnToolDelegate(_ isSelected: Bool) {
        swiftDebug("播放按钮的动作方法", isSelected)
        // 停止播放
        if isSelected {
            self.player?.play()
        } else {
            self.player?.pause()
        }
    }
    
    /// 全屏按钮的动作方法
    func fullBtnToolDelegate(_ isFull: Bool) {
        swiftDebug("全屏按钮的动作方法", isFull)
        // 是否全屏
        self.fullscreenButtonAction(isFull)
    }
    
    /// 静音按钮的动作方法
    func muteBtnToolDelegate(_ isSelected: Bool) {
        swiftDebug("静音按钮的动作方法", isSelected)
        
        //swiftDebug("当前的音量: ", self.player!.playbackVolume)
        
        // 需要保存当前音量
                
        // 是否要静音
        if isSelected == true {
            self.player?.playbackVolume = 0
        } else {
            self.player?.playbackVolume = 0.8
        }
        
    }
}

extension IJkRtmpPlayVC {
        
    /// 是否旋转
    override var shouldAutorotate: Bool {
        return true
    }
    
    /// 支持界面方向
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.allButUpsideDown
    }
    
    /// 全屏按钮动作方法
    private func fullscreenButtonAction(_ isFull: Bool) -> Void {
        swiftDebug("摄像头View 全屏按钮动作方法 \(isFull)")
        if isFull == true {
            // 全屏模式
            if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.allowRotation = true
            }
            UIDevice.current.setValue(NSNumber(value: UIDeviceOrientation.portrait.rawValue), forKey: "orientation")
            UIDevice.current.setValue(NSNumber(value: UIDeviceOrientation.landscapeLeft.rawValue), forKey: "orientation")
            //self.toolView.isHidden = true
            
            UIView.animate(withDuration: 0.5, animations: {
                // 隐藏导航栏
                self.navigationController?.isNavigationBarHidden = true
                self.playView.frame = self.view.frame
                self.toolView.frame = self.view.frame
            }) { (finished) in
                
            }
        }
        if isFull == false {
            // 非全屏模式
            if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.allowRotation = false
            }
            UIDevice.current.setValue(NSNumber(value: UIDeviceOrientation.landscapeLeft.rawValue), forKey: "orientation")
            UIDevice.current.setValue(NSNumber(value: UIDeviceOrientation.portrait.rawValue), forKey: "orientation")
            //self.toolView.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                // 隐藏导航栏
                self.navigationController?.isNavigationBarHidden = false
                // 重新布局约束
                self.setupConstraint()
            }) { (finished) in
                
            }
        }
    }
}

extension IJkRtmpPlayVC {
    /// 设置子控件
    private func setupSubViews() -> Void {
        self.view.addSubview(self.playView)
        self.view.addSubview(self.toolView)
        
        self.playView.translatesAutoresizingMaskIntoConstraints = false
        self.toolView.translatesAutoresizingMaskIntoConstraints = false
        // 设置约束
        self.setupConstraint()
    }
    
    
    /// 设置约束
    private func setupConstraint() -> Void {
        let hightScale = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        
        // 底层播放View
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.playView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0), // 左边
            NSLayoutConstraint(item: self.playView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0), // 右边
            NSLayoutConstraint(item: self.playView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0), // 垂直居中
            NSLayoutConstraint(item: self.playView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.playView, attribute: NSLayoutConstraint.Attribute.width, multiplier: hightScale, constant: 0), // 高度 5.0/9.0
            
        ])
        // 工具播放View
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.toolView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0), // 左边
            NSLayoutConstraint(item: self.toolView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0), // 右边
            NSLayoutConstraint(item: self.toolView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0), // 垂直居中
            NSLayoutConstraint(item: self.toolView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.toolView, attribute: NSLayoutConstraint.Attribute.width, multiplier: hightScale, constant: 0), // 高度
        ])
    }
}
