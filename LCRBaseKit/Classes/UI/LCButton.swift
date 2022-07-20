//
//  LCButton.swift
//  Practice
//
//  Created by yuchanglin on 2019/11/15.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit

//MARK: - 取消高亮状态
open class LCButton: UIButton {
    
    open override var isHighlighted: Bool {
        set {
        }
        
        get {
            return false
        }
    }
    
    open enum Position {
        case top
        case bottom
        case left
        case right
    }
    
    private var position: Position?
    private var space: CGFloat = 0
    
    open convenience init(_ position: Position, at space: CGFloat = 0) {
        self.init(type: .custom)
        self.position = position
        self.space = space
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let position = position {
            
            let imageSize:CGSize = imageView?.image?.size ?? CGSize.zero
            let titleSize:CGSize = self.sizeWithText(titleLabel?.text ?? "", height: 20, font: titleLabel?.font ?? UIFont.systemFont(ofSize: 13.0))
            
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + 4), right: 0);
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + 4), left: 0, bottom: 0, right: -titleSize.width);
            
            switch position {
                case .top:
                    titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + space), right: 0);
                    imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + space), left: 0, bottom: 0, right: -titleSize.width);
                case .bottom:
                    titleEdgeInsets = UIEdgeInsets(top: -(imageSize.height + space), left: -imageSize.width, bottom: 0, right: 0)
                    imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(titleSize.height + space), right: -titleSize.width)
                case .left:
                    titleEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: 0)
                    imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space)
                case .right:
                    titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: 0, right: imageSize.width + space);
                    imageEdgeInsets = UIEdgeInsets(top: 0, left: titleSize.width + space, bottom: 0, right: -titleSize.width);
            }
        }
    }
    
    /// 获取字符串长度
    ///
    /// - Parameters:
    ///   - text: <#text description#>
    ///   - height: <#height description#>
    ///   - font: <#font description#>
    /// - Returns: <#return value description#>
   private func sizeWithText(_ text:String, height:CGFloat,font:UIFont) -> CGSize{
        let sting: NSString = text as NSString
        let attributes = [NSAttributedString.Key.font:font]
        
        let rect = sting.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
        return rect.size
    }
}
