//
//  IJkRtmpPlayVC.swift
//  Gem_Home
//
//  Created by SongMengLong on 2022/12/29.
//

import UIKit

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
        
//        self.player?.prepareToPlay()
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6.0) {
            
        }
        
        // 添加loading
//        ProgressHUD.showMessage(NSLocalizedString("正在加载", comment: ""))
        // 没有播放的状态返回时 延时20s消失hud
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 20.0) {
            swiftDebug("没有播放的状态返回时 延时20s后HUD消失")
//            ProgressHUD.hide()
//            if self.didConnect ==  false {
//                self.navigationController?.popViewController(animated: true)
//            }
        }
    }
    
    /// 页面已经加载
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("云监控", comment: "")
        // 背景颜色设置为黑色
        self.view.backgroundColor = UIColor.black
        // 设置子控件
        self.setupSubViews()
        
//        self.player?.prepareToPlay()
        
//        self.player?.play()
        
//        let previewUrl: String = "rtsp://gemvary.51vip.biz:8604/EUrl/EATwX0A?params=eyJwcm90b2NvbCI6InJ0c3AiLCJleHBhbmQiOiJzdHJlYW1mb3JtPXJ0cCIsInVzZXJJZCI6ImFkbWluIiwidCI6MSwiYSI6IjI2ZThkNTUyZTIzNjQ1ZjdhMWJjY2JkMzYwM2JkYTI2fDUyfDB8MXxvcGVuX2FwaSJ9"
//
//        let options = IJKFFOptions.byDefault()
//        self.player = IJKFFMoviePlayerController(contentURL: URL(string: previewUrl), with: options)
//        self.player?.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
//        self.player?.view.frame = self.playView.bounds
//        self.player?.scalingMode = IJKMPMovieScalingMode.aspectFit
//        self.player?.shouldAutoplay = true
////        self.player.shouldAutoplay = YES;
//
//        self.playView.addSubview((self.player?.view)!)
    }
    
    /// 页面即将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.didDisappear = true
        
        //DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
        //}
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 隐藏hud
//        ProgressHUD.hide()
        
//        if let ip = self.device.ip {
//            self.phoneObtainCameraRequest(ip: ip)
//        }
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
            
        } else {
            
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
        // 是否要静音
        if isSelected == true {
            
        } else {
            
        }
        
    }
}

/// 代理方法
//extension IJkRtmpPlayVC: TianDyMonitorDelegate {
//
//    /// 回调的处理
//    func mainCallBackFunc(withCmd cmd: Int32) {
//        swiftDebug("天地伟业摄像头的代理方法:: ", cmd)
//        // 根据返回值进行处理
//        switch cmd {
//        case 3: // 登录成功
//            //DispatchQueue.main.async {
//                // 登录成功
//                //self.didConnect = true
//                // 开始播放
//                self.monitorTool.sdkStartRealplay(self.playView)
//            //}
//            break
//        case 4: // 登录失败
//            DispatchQueue.main.async {
//                ProgressHUD.showText("登录失败")
//            }
//            break
//        case 5:
//            DispatchQueue.main.async {
//                ProgressHUD.showText("断开摄像头连接")
//            }
//        case 13: // 开始播放
//            break
//        case 40:
//            if self.didDisappear == true {
//                swiftDebug("已经退出当前页面")
//                return
//            }
//            if self.monitorTool.loginFd == -1  {
//                swiftDebug("当前设备已经登出")
//                return
//            }
//            DispatchQueue.main.async {
//                //ProgressHUD.showText("接收到第一帧画面")
//                // 隐藏loading
//                ProgressHUD.hide()
//                self.didConnect = true
//                if let name = self.device.name {
//                    let filename = TdwyDeviceTool.getImagePath(name: name)
//                    swiftDebug("准备开始截图 抓取第一帧画面")
//                    // 抓拍图片
//                    self.monitorTool.sdkRealplayCapturePic(withFilename: filename)
//                }
//            }
//            break
//        default:
//            break
//        }
//    }
//
//    /// 对讲的动作方法
//    func mainCallBackFunc(withFd fd: Int32, cmd: Int32) {
//        swiftDebug("实现对讲的方法")
//    }
//}


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
//                appDelegate.allowRotation = true
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
//                appDelegate.allowRotation = false
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
