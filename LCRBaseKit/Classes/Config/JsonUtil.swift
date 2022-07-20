//
//  JsonUtil.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/10/15.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit
import HandyJSON
open class JsonUtil: NSObject {
    /**
     *  Json转对象
     */
    open static func jsonToModel(_ jsonStr:String,_ modelType:HandyJSON.Type) ->BaseModel {
        if jsonStr == "" || jsonStr.count == 0 {
            #if DEBUG
                print("jsonoModel:字符串为空")
            #endif
            return BaseModel()
        }
        return modelType.deserialize(from: jsonStr)  as! BaseModel
        
    }
    
    /**
     *  Json转数组对象
     */
    open static func jsonArrayToModel(_ jsonArrayStr:String, _ modelType:HandyJSON.Type) ->[BaseModel] {
        if jsonArrayStr == "" || jsonArrayStr.count == 0 {
            #if DEBUG
                print("jsonToModelArray:字符串为空")
            #endif
            return []
        }
        var modelArray:[BaseModel] = []
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
    open static func dictionaryToModel(_ dictionStr:[String:Any],_ modelType:HandyJSON.Type) -> BaseModel {
        if dictionStr.count == 0 {
            #if DEBUG
                print("dictionaryToModel:字符串为空")
            #endif
            return BaseModel()
        }
        return modelType.deserialize(from: dictionStr) as! BaseModel
    }
    
    /**
     *  对象转JSON
     */
    open static func modelToJson(_ model:BaseModel?) -> String {
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
    open static func modelToDictionary(_ model:BaseModel?) -> [String:Any] {
        if model == nil {
            #if DEBUG
                print("modelToJson:model为空")
            #endif
            return [:]
        }
        return (model?.toJSON())!
    }
    
    open static func jsonDictionary(res: [String:Any]) -> String {
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
