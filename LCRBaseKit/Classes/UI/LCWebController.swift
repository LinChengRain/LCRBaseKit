//
//  LCWebController.swift
//  FashionApps
//
//  Created by yuchanglin on 2019/11/18.
//  Copyright © 2019 yuchanglin. All rights reserved.
//

import UIKit
import WebKit

/// kvo 观察属性关键字
private let  KVO_KEYWORD = "estimatedProgress"

public class LCWebController: UIViewController {
    
    /** 加载 URL */
    open var url:String?
    /** 是否可以刷新 */
    public var canRefresh:Bool = false
    
    public var webView:WKWebView!
    /** 加载菊花 */
    private var progressView:UIProgressView = {
        let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: AppFrame.kScreen_Width, height: 3))
        progressView.progressTintColor = UIColor(red: 0.29, green: 0.65, blue: 0.91, alpha: 1)
        progressView.trackTintColor =  .white
        return progressView
    }()
    
    /** 刷新 */
    private var refreshControl:UIRefreshControl = {
        let refresh = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: AppFrame.kScreen_Width, height: 5))
        refresh.addTarget(self, action: #selector(refreshWeb), for: .valueChanged)
        return refresh
    }()
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        createProgressView()
        
        if let urlString = url {
            if urlString.hasPrefix("http")  {
                createWKWebView()
                
            } else {
                createWKforRichView()
            }
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func createWKforRichView() {
        
        let jScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width,user-scalable=no'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';$img[p].style.display = 'block';}"
        
        let wkUScript = WKUserScript(source: jScript, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        let wkUController = WKUserContentController()
        // 添加自适应屏幕宽度js调用的方法
        wkUController.addUserScript(wkUScript)
        
        let javascript = "document.documentElement.style.webkitTouchCallout='none';document.documentElement.style.webkitUserSelect='none';"
        let noneSelectScript = WKUserScript(source: javascript, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        // 添加自适应屏幕宽度js调用的方法
        wkUController.addUserScript(noneSelectScript)
        
        let wk = WKWebViewConfiguration()
        wk.userContentController = wkUController
        webView = WKWebView(frame:.zero, configuration: wk)
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.bounces = false
        webView.navigationDelegate = self
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.isOpaque = false
        
        webView.frame = CGRect(x: 0, y:3, width: AppFrame.kScreen_Width, height: AppFrame.kScreen_Height - AppFrame.W_Height_NavBar - 3)
        if #available(iOS 11.0, *) { // ios11 以上偏移
            webView.scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        
        view.addSubview(webView)
        
        webView.addObserver(self, forKeyPath: KVO_KEYWORD, options: .new, context: nil)
        
        if let urlString = url,urlString.count > 0 {
            self.webView.loadHTMLString(self.autoContentForPicture(urlString), baseURL: nil)
        }
    }
    
    private func createWKWebView() {
        view.backgroundColor = .white
        let userContentController = WKUserContentController()
        let jScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width,user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';$img[p].style.display = 'block';}"
        
        let wkUScript = WKUserScript(source: jScript, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        //        let wkUController = WKUserContentController()
        // 添加自适应屏幕宽度js调用的方法
        userContentController.addUserScript(wkUScript)
        
        let javascript = "document.documentElement.style.webkitTouchCallout='none';document.documentElement.style.webkitUserSelect='none';"
        let noneSelectScript = WKUserScript(source: javascript, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        // 添加自适应屏幕宽度js调用的方法
        userContentController.addUserScript(noneSelectScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        webView = WKWebView(frame: CGRect(x: 0, y: 3, width: AppFrame.kScreen_Width, height: AppFrame.kScreen_Height - AppFrame.W_Height_NavBar - 3) , configuration: configuration)
        
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.sizeToFit()
        if #available(iOS 11.0, *) { // ios11 以上偏移
            webView.scrollView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never;
        } else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        
        if #available(iOS 10.0, *), canRefresh {
            webView.scrollView.refreshControl = refreshControl
        }
        
        view.addSubview(webView)
        webView.addObserver(self, forKeyPath: KVO_KEYWORD, options: .new, context: nil)
        
        if let urlString = url,urlString.count > 0 {
            webView.load(URLRequest(url: URL(string: urlString)!))
        }
    }
    
    private func createProgressView() {
        
        view.addSubview(progressView)
    }
    
    // 刷新请求数据
    @objc private func refreshWeb() {
        webView.reload()
    }
    
    
    deinit {
        if (webView != nil) {
            webView.removeObserver(self, forKeyPath: KVO_KEYWORD)
        }
    }
    
    /// 拼接html
    /// - Parameter html: 富文本内容
    /// - Returns: html
    private func autoContentForPicture(_ html:String) -> String{
        
        let htmlhead = "<!DOCTYPE html>" +
        "<html> " +
        "<head> " +
        "<style type=\"text/css\"> " +
        "body {font-size:15px;padding:0px;margin:0px;}" +
        "</style> " +
        "</head> " +
        "<body>" +
        "<script type='text/javascript'>" +
        "window.onload = function(){" +
        "var $img = document.getElementsByTagName('img');" +
        "for(var p in  $img){" +
        "$img[p].style.width = '100%%';" +
        "$img[p].style.height ='auto';" +
        "$img[p].style.display = 'block';" +
        "}" +
        "}" +
        "</script>"
        
        let htmlEnd = "</body></html>"
        let mainHtml = "\(html)"
        
        return htmlhead + mainHtml + htmlEnd
    }
}

extension LCWebController:WKNavigationDelegate {
    
    ///  网络开始请求
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressView.isHidden = false
    }
    /// 网络结束请求
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        refreshControl.endRefreshing()
    }
}
/// KVO
extension LCWebController {
    //KVO
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == KVO_KEYWORD {
            let newValue = change![NSKeyValueChangeKey.newKey] as! CGFloat
            progressView.progress = Float(newValue)
            
            if newValue >= 1.00 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
                    self.progressView.isHidden = true
                }
            }
        }
    }
}
