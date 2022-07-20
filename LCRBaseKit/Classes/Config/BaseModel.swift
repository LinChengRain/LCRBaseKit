//
//  BaseModel.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/10/14.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit
import HandyJSON

open class BaseModel: HandyJSON {
    var status:Int = 0
    var msg:String?

    required  public init() {}
      
    public func mapping(mapper: HelpingMapper) {   //自定义解析规则，日期数字颜色，如果要指定解析格式，子类实现重写此方法即可
    }
}

open class BaseDataModel<T: HandyJSON>: HandyJSON {
    
    var status:Int = 0
    var msg:String?
    var data:T?

    required  public init() {}

}


open class CommonModel: BaseModel {

    var data:AnyObject?

    required  public init() {}
}
