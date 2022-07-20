//
//  LCNetRequestClass.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/9/9.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit
import LCRNetServiceKit
import Reachability
/// 宏定义请求成功的block
typealias ResponseSuccess = (_ response: AnyObject) -> Void
/// 宏定义请求失败的block
typealias ResponseFail = (_ error: String) -> Void
/// 上传或者下载的进度
typealias ProgressResult =  (Double) -> Void//进度
/// 状态码
typealias NetworkStatus = (_ LCNetworkStatus: LCNetServiceStatus) -> Void

public enum LCNetServiceStatus: Int32 {
     case  HttpUnknow       = -1  //未知
     case  HttpNoReachable  = 0  // 无网络
     case  HttpWwan         = 1   //2g ， 3g 4g
     case  HttpWifi         = 2  // wifi
}

class LCNetRequestClass: NSObject {
   
    public static let ReceiveNetworkStatusChange = Notification.Name(rawValue: "ReceiveNetworkStatusChange")
    /// 用户未登录
    public static let ReceiveUserUnLogin = Notification.Name(rawValue: "ReceiveUserUnLogin")

    static let shared = LCNetRequestClass()
    
    ///缓存存储地址
    private  let cachePath = NSHomeDirectory() + "/Documents/AlamofireCaches/"
    /// 错误码
    static let errorMsg = "米芽：网络连接失败"
    
    public var networkStatus: LCNetServiceStatus = .HttpWwan {
        didSet {
            NotificationCenter.default.post(name: LCNetRequestClass.ReceiveNetworkStatusChange, object: networkStatus)
        }
    }
    
    private let reachability = try! Reachability()

    public func listenerForReachability() {
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                LCLog("Reachable via WiFi")
            } else {
                LCLog("Reachable via Cellular")
            }
            self.networkStatus = .HttpWwan
        }
        
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            self.networkStatus = .HttpNoReachable
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}

extension LCNetRequestClass{
    
    ///  POST/GET
    ///
    /// - Parameters:
    ///   - requestType: 请求方式
    ///   - headerParams: 响应头参数
    ///   - url: 请求网址路径
    ///   - params:  请求参数
    ///   - success: 成功回调
    ///   - fail: 失败回调
    public func requestData(_ apiServiceItem: ApiServiceItem,parameters: [String:Any]? = nil,success:@escaping ResponseSuccess,fail: @escaping ResponseFail){
        /// 请求方法
        let mode = apiServiceItem.method
        /// 接口名称
        LCLog("接口名称: <\(apiServiceItem.description)>")
        LCLog("接口地址: \(apiServiceItem.url)")

        // 获取cache路径， 用于存储post（get）请求的内容
        var sandBoxPath : String = cachePath
        var data : NSDictionary?
        if apiServiceItem.isCache {

            if let parameter = parameters,parameter.values.count > 0 {
                LCLog("接口参数: \(parameter)")
                let str = apiServiceItem.url + JsonUtil.jsonDictionary(res: parameter)
                sandBoxPath = sandBoxPath + "\(str.md5())"
            } else {
                sandBoxPath = sandBoxPath + "\(apiServiceItem.url.md5())"
            }
            let manager = FileManager.default
            if manager.fileExists(atPath: sandBoxPath) {
                data = NSDictionary(contentsOfFile: sandBoxPath)
            } else {
                do {
                    try manager.createDirectory(atPath: cachePath, withIntermediateDirectories: true, attributes: nil)
//                    LCLog("创建缓存路径成功")
                } catch {
//                    LCLog("创建缓存路径失败")
                }
            }
        } else {
            if let parameter = parameters,parameter.values.count > 0 {
                LCLog("接口参数: \(parameter)")
            }
        }
        
        LCRNetServiceKit.shared.requestData(requestType: mode, headerParams: apiServiceItem.header, url: apiServiceItem.url, parameters: parameters) { (data) in
           
            // 成功后写入缓存
            if apiServiceItem.isCache {
                do{
                    try (data as! NSDictionary).write(to: URL(fileURLWithPath: sandBoxPath))
//                    LCLog("r存入成功")
                } catch {
//                    LCLog("r存入失败")
                }
            }
            
            LCLog("接口结果--<\(apiServiceItem.url)>:\n \(self.dataTypeTurnJson(element: data))")
            success(data)
            self.handleSuccess(data)
        } failure: { (error) in

            if apiServiceItem.isCache {
                // 处理 缓存  如果网络请求成功 返回 请求内容 如果失败 返回存储的数据
                guard let anyObject = data else {
                    return fail(self.failure(error))
                }
                LCLog("从缓存中取数据：\(anyObject)")
                success(data as AnyObject)
            } else {
                return fail(self.failure(error))
            }
        }
    }
    
    /// 上传图片
    ///
    /// - Parameters:
    ///   - apiServiceItem: 请求网址路径
    ///   - parameters:  请求参数
    ///   - imageData: 图片二进制数据
    ///   - fileName: 文件命名空间
    ///   - progressBlock: 进度
    ///   - success: 成功回调
    ///   - fail: 失败回调
    public func uploadImage(_ apiServiceItem: ApiServiceItem,
                            parameters: [String:Any]? = nil,
                            imageData: Data,
                            fileName: String?,
                            progressBlock:@escaping ProgressResult,success:@escaping ResponseSuccess,fail: @escaping ResponseFail){
        
        /// 接口名称
        print("接口名称: <\(apiServiceItem.description)>")
        print("接口地址: \(apiServiceItem.url)")
        if let parameter = parameters,parameter.values.count > 0 {
            print("请求参数: \(parameter)")
        }
        LCRNetServiceKit.shared.uploadImage(url: apiServiceItem.url, imageData: imageData,fileName: fileName, headerParams:apiServiceItem.header, progressBlock: progressBlock, success: success) { (error) in
            fail(self.failure(error))
        }
    }
    
    
    /// 上传视频
    ///
    /// - Parameters:
    ///   - url: 请求网址路径
    ///   - parameters:  请求参数
    ///   - video: 视频二进制数据
    ///   - fileName: 文件命名空间
    ///   - headers: 响应头参数
    ///   - progressBlock: 进度
    ///   - success: 成功回调
    ///   - fail: 失败回调
    public func uploadVideo(_ url:String ,parameters: [String:Any]? = nil, video: Data,fileName:String?, _ headers:[String:String]? = nil,progressBlock:@escaping ProgressResult,success:@escaping ResponseSuccess,fail: @escaping ResponseFail){
        
        LCRNetServiceKit.shared.uploadVideo(url: url, parameters: parameters,video: video, fileName: fileName, headerParams: headers, progressBlock: progressBlock, success: success) { (error) in
            fail(self.failure(error))
        }
    }
    

    /// 取消网络
    func cancel() {
        LCRNetServiceKit.shared.cancel()
    }
    
    /// 错误异常处理
    /// - Parameter error: 错误参数
    /// - Returns: 全局描述
    private func failure(_ error:AnyObject) -> String {
        if !(error is NSError) {
            return ""
        }
        
        let newError = error as! NSError
        
        print("error code:\(newError.code)")
        print("error desc:\(newError.localizedDescription)")
        return LCNetRequestClass.errorMsg.count > 0 ? LCNetRequestClass.errorMsg:newError.localizedDescription
    }
    
    /// 错误异常处理
    /// - Parameter error: 错误参数
    /// - Returns: 全局描述
    private func handleSuccess(_ response:AnyObject) {
        
        let obj = JsonUtil.dictionaryToModel(response as! [String:Any], BaseModel.self)

        if obj.status == 501 {
            resetData()
            NotificationCenter.default.post(name: LCNetRequestClass.ReceiveUserUnLogin, object: nil)
        }
    }
    
    // 字典或者数组 转 JSON
    func dataTypeTurnJson(element:AnyObject) -> String {
         
        let jsonData = try! JSONSerialization.data(withJSONObject: element, options: JSONSerialization.WritingOptions.prettyPrinted)
        let str = String(data: jsonData, encoding: String.Encoding.utf8)!
         return str
     }
}
