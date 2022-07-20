//
//  LCWidge.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/9/17.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit

open class LCBaseWidge: NSObject {
    
    /// 快速创建按钮(全)
    ///
    /// - Parameters:
    ///   - imageName: 图片
    ///   - titleColor: 字体颜色
    ///   - titleFont: 字体大小
    ///   - backgroundColor: 背景颜色
    ///   - title: 标题
    /// - Returns: button
    public static func buttonWith(imageName: String?, titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?) -> LCButton {
        let button = LCButton(type: .custom)
        button.backgroundColor = backgroundColor
        if title?.count != nil {
            button.setTitle(title, for: UIControl.State.normal)
            button.setTitleColor(titleColor, for: UIControl.State.normal)
        }
        if titleFont != nil {
            button.titleLabel?.font = titleFont
        }
        if (imageName?.count) != nil {
            button.setImage(UIImage(named: imageName!), for: UIControl.State.normal)
            if title?.count != nil {
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width / 375, bottom: 0, right: 0)
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.size.width / 375)
            }
        }
        return button
    }
    
    /// 快速创建按钮(无图片)
    ///
    /// - Parameters:
    ///   - titleColor: 字体颜色
    ///   - titleFont: 字体大小
    ///   - backgroundColor: 背景颜色
    ///   - title: 标题
    /// - Returns: button
    public static func buttonWith(titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?, title: String?) -> LCButton {
        return LCBaseWidge.buttonWith(imageName: nil, titleColor: titleColor, titleFont: titleFont, backgroundColor: backgroundColor, title: title)
    }
    
    /// 快速创建按钮（图片）
    ///
    /// - Parameters:
    ///   - imageName: 图片
    ///   - backgroundColor: 背景颜色
    /// - Returns: button
    public static func buttonWith(imageName: String?,backgroundColor: UIColor?) -> LCButton {
        return LCBaseWidge.buttonWith(imageName: imageName, titleColor: nil, titleFont: nil, backgroundColor: backgroundColor, title: nil)
    }
    
    /// 快速创建按钮(背景颜色)
    ///
    /// - Parameters:
    ///   - backgroundColor: 背景颜色
    /// - Returns: button
    public static func buttonWith(backgroundColor: UIColor?) -> LCButton {
        return LCBaseWidge.buttonWith(imageName: nil, titleColor: nil, titleFont: nil, backgroundColor: backgroundColor, title: nil)
    }
    
    /// 快速创建label(背景颜色)
    ///
    /// - Parameters:
    ///   - backgroundColor: 背景颜色
    /// - Returns: button
    public static func createLab(_ title: String?,titleColor: UIColor?, titleFont: UIFont?, backgroundColor: UIColor?) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = titleFont
        label.textColor = titleColor
        if backgroundColor != nil {
            label.backgroundColor = backgroundColor
        }
        return label
    }
}
