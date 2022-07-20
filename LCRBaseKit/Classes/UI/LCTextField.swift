//
//  LCTextField.swift
//  Practice
//
//  Created by yuchanglin on 2019/12/27.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit

open class LCTextField: UITextField {

    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        return false
    }
}
