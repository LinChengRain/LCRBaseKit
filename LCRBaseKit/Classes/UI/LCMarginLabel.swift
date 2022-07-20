//
//  LCMarginLabel.swift
//  Practice
//
//  Created by yuchanglin on 2019/11/22.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit

open class LCMarginLabel: UILabel {
    
    var contentInset: UIEdgeInsets = .zero
    
    open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var rect: CGRect = super.textRect(forBounds: bounds.inset(by: contentInset), limitedToNumberOfLines: numberOfLines)
        //根据edgeInsets，修改绘制文字的bounds
        rect.origin.x -= contentInset.left;
        rect.origin.y -= contentInset.top;
        rect.size.width += contentInset.left + contentInset.right;
        rect.size.height += contentInset.top + contentInset.bottom;
        return rect
    }
    
    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }
}
