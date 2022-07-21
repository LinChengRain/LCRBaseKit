//
//  JsonUtil.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/10/15.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit
import HandyJSON
open class LCRJsonUtil: NSObject {
    /**
     *  Json转对象
     */
    public static func jsonToModel(_ jsonStr:String,_ modelType:HandyJSON.Type) ->LCRBaseModel {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonoModel:字符串为空")
            #endif
            return LCRBaseModel()
        }
        return modelType.deserialize(from: jsonStr)  as! LCRBaseModel
        
    }
    
    /**
     *  Json转数组对象
     */
    public static func jsonArrayToModel(_ jsonArrayStr:String, _ modelType:HandyJSON.Type) ->[LCRBaseModel] {
        if jsonArrayStr == "" || jsonArrayStr.count == 0 {
            #if DEBUG
                print("jsonToModelArray:字符串为空")
            #endif
            return []
        }
        var modelArray:[LCRBaseModel] = []
        let data = jsonArrayStr.data(using: String.Encoding.utf8)
        let peoplesArray = try! JSONSerialization.jsonObject(with:data!, options: JSONSerialization.ReadingOptions()) as? [AnyObject]
        for people in peoplesArray! {
            modelArray.append(dictionaryToModel(people as! [String : Any], modelType))
        }
        return modelArray
        
    }
    
    /**
     *  字典转对象
     */
    public static func dictionaryToModel(_ dictionStr:[String:Any],_ modelType:HandyJSON.Type) -> LCRBaseModel {
        if dictionStr.count == 0 {
            #if DEBUG
                print("dictionaryToModel:字符串为空")
            #endif
            return LCRBaseModel()
        }
        return modelType.deserialize(from: dictionStr) as! LCRBaseModel
    }
    
    /**
     *  对象转JSON
     */
    public static func modelToJson(_ model:LCRBaseModel?) -> String {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
             return ""
        }
        return (model?.toJSONString())!
    }
    
    /**
     *  对象转字典
     */
    public static func modelToDictionary(_ model:LCRBaseModel?) -> [String:Any] {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
            return [:]
        }
        return (model?.toJSON())!
    }
    
    public static func jsonDictionary(res: [String:Any]) -> String {
        if (!JSONSerialization.isValidJSONObject(res)) {
            print("无法解析出JSONString")
            return " "
        }
        if let data = try? JSONSerialization.data(withJSONObject: res, options: [.fragmentsAllowed,.prettyPrinted]), let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue) as String? {
            return JSONString
        }
        return " "
    }
    
}
