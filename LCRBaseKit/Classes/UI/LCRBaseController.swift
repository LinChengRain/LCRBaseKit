//
//  LCRBaseController.swift
//  LCRBaseKit
//
//  Created by yuchanglin on 2022/7/21.
//

import UIKit
import LCRExtensionSwift
public class LCRBaseController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .kColorF8F8FB
    }
    /// 隐藏返回标题
    public func changeBackBar() {

        if #available(iOS 14.0, *) {
            navigationItem.backBarButtonItem = UIBarButtonItem.init(title: nil, image: UIImage(), primaryAction: nil, menu: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    deinit {
        LCLog("\(self)销毁了")
    }
}
