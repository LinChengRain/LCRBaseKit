//
//  LCCanCopyLabel.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/11/11.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit

open class LCCanCopyLabel: UILabel {
    
    open override var canBecomeFirstResponder: Bool { return true }
    
    // 代码创建控件的时候有效
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    // storyboard或xib创建控件的时候有效
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // 让其有交互能力，并添加一个长按手势
    func setup() {
        isUserInteractionEnabled = true
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(clickLabel)))
    }
    
    @objc func clickLabel() {
        
        // 让其成为响应者
        becomeFirstResponder()
        // 如果 Menu 已经被创建那就不再重复创建 menu
        if (UIMenuController.shared.isMenuVisible){
            return
        }
        // 拿出菜单控制器单例
        let menu = UIMenuController.shared
        // 创建一个复制的item
        let copy = UIMenuItem(title: "复制", action: #selector(copyText))
        // 将复制的item交给菜单控制器（菜单控制器其实可以接受多个操作）
        menu.menuItems = [copy]

        if #available(iOS 13.0, *) {
            menu.showMenu(from: self, rect: bounds)
        } else {
            // 设置菜单控制器的点击区域为这个控件的bounds
            menu.setTargetRect(bounds, in: self)
            // 显示菜单控制器，默认是不可见状态
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    @objc func copyText() {
        
        UIPasteboard.general.string = self.text
        
    }
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if action == #selector(copyText) {
            return true
        } else {
            return false
        }
    }
}
