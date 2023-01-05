//
//  MonitorToolView.swift
//  sip_LHZG
//
//  Created by SongMenglong on 2020/4/1.
//  Copyright © 2020 gemvary. All rights reserved.
//

import UIKit

/// 云监控工具页面
class MonitorToolView: UIView {

    /// 播放按钮
    private lazy var playButton: UIButton = {
        let  button = UIButton()
        button.addTarget(self, action: #selector(playButtonAction(_:)), for: UIControl.Event.touchUpInside)        
        button.setImage(UIImage(named: "monitor_play"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "monitor_suspend"), for: UIControl.State.selected)
        return button
    }()
    
    /// 静音按钮
    private lazy var muteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(muteButtonAction(_:)), for: UIControl.Event.touchUpInside)
        button.setImage(UIImage(named: "monitor_val"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "monitor_mute"), for: UIControl.State.selected)
        return button
    }()
    
    /// 全屏按钮
    private lazy var fullButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(fullButtonAction(_:)), for: UIControl.Event.touchUpInside)
        button.setImage(UIImage(named: "monitor_fullscreen"), for: UIControl.State.normal)
        return button
    }()
    
    /// 声明代理
    weak var delegate: MonitorToolDelegate?
    
    /// 播放按钮的状态
    var playState: Bool = Bool() {
        didSet {
            self.playButton.isSelected = self.playState
        }
    }
    
    /// 初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 设置子控件
        self.setupsubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    /// 播放按钮的动作方法
    @objc private func playButtonAction(_ button: UIButton) -> Void {
        swiftDebug("播放按钮的动作方法")
        self.playButton.isSelected = !self.playButton.isSelected
        
        if self.delegate != nil {
            self.delegate?.playBtnToolDelegate?(self.playButton.isSelected)
        }
    }
    
    /// 静音按钮的动作方法
    @objc private func muteButtonAction(_ button: UIButton) -> Void {
        swiftDebug("静音按钮的动作方法")
        self.muteButton.isSelected = !self.muteButton.isSelected
        
        if self.delegate != nil {
            self.delegate?.muteBtnToolDelegate?(self.muteButton.isSelected)
        }
    }
    
    /// 全屏按钮的动作方法
    @objc private func fullButtonAction(_ button: UIButton) -> Void {
        swiftDebug("全屏按钮的动作方法")
        self.fullButton.isSelected = !self.fullButton.isSelected
        
        if (self.delegate != nil) {
            self.delegate?.fullBtnToolDelegate?(self.fullButton.isSelected)
        }
    }
    
}

/// 设置代码约束
extension MonitorToolView {
    /// 设置子控件
    private func setupsubViews() -> Void {
        self.addSubview(self.playButton)
        self.addSubview(self.muteButton)
        self.addSubview(self.fullButton)
        
        self.playButton.translatesAutoresizingMaskIntoConstraints = false
        self.muteButton.translatesAutoresizingMaskIntoConstraints = false
        self.fullButton.translatesAutoresizingMaskIntoConstraints = false
        
        // 播放按钮
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.playButton, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 10), // 左边
            NSLayoutConstraint(item: self.playButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -10.0), // 底部
            NSLayoutConstraint(item: self.playButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 30.0), // 宽度
            NSLayoutConstraint(item: self.playButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 30.0), // 高度
        ])
        
        // 静音按钮
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.muteButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 20.0), // 顶部
            NSLayoutConstraint(item: self.muteButton, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -10), // 右边
            NSLayoutConstraint(item: self.muteButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 30.0), // 宽度
            NSLayoutConstraint(item: self.muteButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 30.0), // 高度
        ])
        // 全屏按钮
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.fullButton, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: -10), // 底部
            NSLayoutConstraint(item: self.fullButton, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: -10.0), // 右边
            NSLayoutConstraint(item: self.fullButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 30.0), // 宽度
            NSLayoutConstraint(item: self.fullButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 30.0), // 高度
        ])
    }
}


/// 实现代理协议方法
@objc protocol MonitorToolDelegate {
    /// 对讲按钮代理方法
    @objc optional func playBtnToolDelegate(_ isSelected: Bool) -> Void
    
    /// 静音按钮动作方法
    @objc optional func muteBtnToolDelegate(_ isSelected: Bool) -> Void
    
    /// 全屏按钮动作方法
    @objc optional func fullBtnToolDelegate(_ isFull: Bool) -> Void
    
}
