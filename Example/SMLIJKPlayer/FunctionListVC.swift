//
//  FunctionListVC.swift
//  SMLIJKPlayer_Example
//
//  Created by SongMengLong on 2022/12/28.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class FunctionListVC: UIViewController {

    private let cellID: String = "FunctionListCell"
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellID)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        return tableView
    }()
    
    private let dataList: [String] = ["OC播放", "Swift播放"]
            
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        self.setupSubViews()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FunctionListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)
//        cell.textLabel?.text = "准备播放"
        cell.textLabel?.text = self.dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: // OC播放
//            let previewUrl: String = "http://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"            
                        
//            IJKVideoViewController.present(from: self, withTitle: "准备播放", url: URL(string: previewUrl)) {
//                debugPrint("跳转成功")
//            }
            
            // 获取本地资源
            let previewUrl = Bundle.main.url(forResource: "230105", withExtension: "mp4")
            
            IJKVideoViewController.present(from: self, withTitle: "准备播放", url:  previewUrl) {
                debugPrint("跳转成功")
            }
            break
        case 1:
            let ijkRtmpPlayVC = IJkRtmpPlayVC()
            self.navigationController?.pushViewController(ijkRtmpPlayVC, animated: true)
            break
        default:
            break
        }
        
    }
    
}

extension FunctionListVC {
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0),
        ])
    }
    
    private func setupSubViews() -> Void {
        
    }
}
