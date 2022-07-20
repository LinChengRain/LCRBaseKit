//
//  LCHud.swift
//  Practice
//
//  Created by apple on 2020/11/7.
//  Copyright © 2020 yuchanglin. All rights reserved.
//

import UIKit
import LCRExtensionSwift
private let delayTime : TimeInterval = 1.5
private let padding : CGFloat = 12
private let cornerRadius : CGFloat = 13.0
private let imageWidth_Height : CGFloat = 36

private let textFont = UIFont.systemFont(ofSize: 14)

private let keyWindow = UIApplication.shared.keyWindow!

private let JIdentifier = "JScreenView"

enum LCHudType {
    case success // image + text
    case error   // image + text
    case info    // image + text
    case loading // image
    case text    // text
    case toast
}

public class LCHud:UIView {
    
    private var delay : TimeInterval = 1.5
    private var imageView :UIImageView?
    private var activityView : UIActivityIndicatorView?
    private var type : LCHudType?
    private var text : String?
    private var selfWidth:CGFloat = 90
    private var selfHeight:CGFloat = 90

    // enable ：是否允许用户交互，默认允许。
    init(text:String?,type:LCHudType,delay:TimeInterval,enable:Bool = true,offset:CGPoint = CGPoint(x: 0, y: -50)) {
        self.delay = delay
        self.text = text
        self.type = type

        super.init(frame: CGRect(origin: CGPoint.zero,
                                   size: CGSize(width: selfWidth,
                                                height: selfWidth)))
        
        
        setupUI()

        addLabel()
        addHUDToKeyWindow(offset:offset)

        if !enable { // 不可交互。
            keyWindow.addSubview(screenView)
        }
        
        if type == .toast {
            self.layer.cornerRadius = selfHeight*0.5
        }
    }

    private func setupUI() {

        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.layer.cornerRadius = cornerRadius

        if text != nil {
            selfWidth = 110
        }

        guard let type = type else { return }
        switch type {
            case .success:
                addImageView(image: LCHudImage.imageOfSuccess)
            case .error:
                addImageView(image: LCHudImage.imageOfError)
            case .info:
                addImageView(image: LCHudImage.imageOfInfo)
            case .loading:
                addActivityView()
                var textW =
                    text?.textSizeWithFont(font: textFont,
                                           constrainedToSize:
                                            CGSize(width:CGFloat(MAXFLOAT), height:30)).width ?? 0
                if textW > UIScreen.main.bounds.size.width - 200 {
                    textW = UIScreen.main.bounds.size.width - 200
                }
                selfWidth = textW + padding * 2
            case .text,.toast:
                var textW =
                    text?.textSizeWithFont(font: textFont,
                                           constrainedToSize:
                                            CGSize(width:CGFloat(MAXFLOAT), height:30)).width
                if textW! > UIScreen.main.bounds.size.width - 100 {
                    textW! = UIScreen.main.bounds.size.width - 100
                }
                selfWidth = textW! + padding * 2
                break
        }

    }

    private func addHUDToKeyWindow(offset:CGPoint) {
        guard self.superview == nil else { return }
        keyWindow.addSubview(self)
        self.alpha = 0

        addConstraint(width: selfWidth, height: selfHeight) //
        keyWindow.addConstraint(toCenterX: self, constantx: offset.x, toCenterY: self, constanty: offset.y)
    }

    private func addLabel() {

        var labelY:CGFloat = 0.0
        if type == .toast || type == .text {
            labelY = padding
        } else {
            labelY = padding * 2 + imageWidth_Height
        }
        if let text = text {
            textLabel.text = text
            addSubview(textLabel)

            addConstraint(to: textLabel,
                          edageInset: UIEdgeInsets(top: type == .toast ? labelY/2:labelY,
                                                   left: padding/2,
                                                   bottom: -(type == .toast ? padding/2:padding),
                                                   right: -padding/2))
            let textSize:CGSize = size(from: text)
            if self.type == .toast {
                selfHeight = textSize.height + labelY + 8
            } else {
                selfHeight = textSize.height + labelY + padding + 8
            }
        }
    }

    private func size(from text:String) -> CGSize {
       return text.textSizeWithFont(font: textFont,
                                         constrainedToSize:
            CGSize(width:selfWidth - padding, height:CGFloat(MAXFLOAT)))
    }

    private func addImageView(image:UIImage) {

        imageView = UIImageView(image: image)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView!)

        generalConstraint(at: imageView!)
    }

    private func addActivityView() {
        activityView = UIActivityIndicatorView(style: .whiteLarge)
        activityView?.translatesAutoresizingMaskIntoConstraints = false
        activityView?.startAnimating()
        addSubview(activityView!)

        generalConstraint(at: activityView!)
    }

    private func generalConstraint(at view:UIView) {

        view.addConstraint(width: imageWidth_Height,
                                    height: imageWidth_Height)
        if let _ = text {
            addConstraint(toCenterX: view, toCenterY: nil)
            addConstraint(with: view,
                          topView: self,
                          leftView: nil,
                          bottomView: nil,
                          rightView: nil,
                          edgeInset: UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0))
        } else {
            addConstraint(toCenterX: view, toCenterY: view)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // TODO: Show func
    public static func showSuccess(_ text:String?,delay:TimeInterval = 1,enable:Bool = false) {
        LCHud(text: text, type: .success, delay: delay,enable: enable).show()
    }

    public static func showError(_ text:String?,delay:TimeInterval = 1,enable:Bool = false) {
        LCHud(text: text, type: .error, delay: delay,enable:enable).show()
    }

    public static func showLoading(enable:Bool = false) {
        LCHud(text: nil,type:.loading,delay: 0,enable:enable).show()
    }

    public static func showLoading(_ text:String?,enable:Bool = false) {
        LCHud(text: text,type:.loading,delay: 0,enable:enable).show()
    }

    public static func showInfo(_ text:String?,delay:TimeInterval = 1,enable:Bool = false) {
        LCHud(text: text, type: .info, delay: delay,enable:enable).show()
    }

    public static func showText(_ text:String?,delay:TimeInterval = 1,enable:Bool = false) {
        LCHud(text: text,type:.text,delay: delay,enable:enable).show()
    }

    public static func showToast(_ text:String?,delay:TimeInterval = 1) {
        let offsetY = UIScreen.main.bounds.size.height*0.5 - AppFrame.W_Height_TabBar - 50
        LCHud(text: text, type: .toast, delay: delay,enable:false,offset: CGPoint(x: 0, y: offsetY)).show()
    }
    
    public func show() {

        self.animate(hide: false) {
            if self.delay > 0 {
                LCHud.asyncAfter(duration: self.delay, completion: {
                    self.hide()
                })
            }
        }
    }

    //MARK: Hide func
    public func hide() {
        self.animate(hide: true, completion: {
            self.removeFromSuperview()
            self.screenView.removeFromSuperview()
        })
    }

    public func hide(delay:TimeInterval = 1) {
        LCHud.asyncAfter(duration: delay) {
            self.hide()
        }
    }

    public static func hide() {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        for view in keyWindow.subviews {
            if view.isKind(of:self) {
                view.animate(hide: true, completion: {
                    view.removeFromSuperview()
                })
            }
            if view.restorationIdentifier == JIdentifier {
                view.removeFromSuperview()
            }
        }
    }

    public static func hide(delay:TimeInterval = 1) {
        asyncAfter(duration: delay) {
            hide()
        }
    }

    private lazy var screenView:UIView = {
        $0.frame = UIScreen.main.bounds
//        $0.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        $0.restorationIdentifier = JIdentifier
        $0.isUserInteractionEnabled = true
        return $0
    }(UIView())

    private lazy var textLabel:UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = UIColor.white
        $0.font = textFont
        $0.numberOfLines = 0
        $0.textAlignment = .center
        return $0
    }(UILabel())

}

//TODO: Extension String
extension String {

   fileprivate func textSizeWithFont(font: UIFont,
                                     constrainedToSize size:CGSize) -> CGSize {
        var textSize:CGSize!
        if size.equalTo(CGSize.zero) {
            let attributes = [NSAttributedString.Key.font:font]
            textSize = self.size(withAttributes: attributes)
        } else {
            let option = NSStringDrawingOptions.usesLineFragmentOrigin
            let attributes = [NSAttributedString.Key.font:font]
            let stringRect = self.boundingRect(with: size,
                                               options: option,
                                               attributes: attributes,
                                               context: nil)
            textSize = stringRect.size
        }
        return textSize
    }
}
//TODO: Extension LCHud
extension LCHud {

    fileprivate class func asyncAfter(duration:TimeInterval,
                                completion:(() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration,
                                      execute: {
            completion?()
        })
    }
}

//TODO: Extension UIView
extension UIView {
    fileprivate func animate(hide:Bool,
                             completion:(() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3,
                       animations: {
            if hide {
                self.alpha = 0
            }else {
                self.alpha = 1
            }
        }) { _ in
            completion?()
        }
    }
}

//MARK: Class LCHudImage
private class LCHudImage {
    fileprivate struct HUD {
        static var imageOfSuccess: UIImage?
        static var imageOfError: UIImage?
        static var imageOfInfo: UIImage?
    }

    fileprivate class func draw(_ type: LCHudType) {
        let checkmarkShapePath = UIBezierPath()

        checkmarkShapePath.move(to: CGPoint(x: 36, y: 18))
        checkmarkShapePath.addArc(withCenter: CGPoint(x: 18, y: 18),
                                  radius: 17.5,
                                  startAngle: 0,
                                  endAngle: CGFloat(Double.pi*2),
                                  clockwise: true)
        checkmarkShapePath.close()

        switch type {
        case .success:
            checkmarkShapePath.move(to: CGPoint(x: 10, y: 18))
            checkmarkShapePath.addLine(to: CGPoint(x: 16, y: 24))
            checkmarkShapePath.addLine(to: CGPoint(x: 27, y: 13))
            checkmarkShapePath.move(to: CGPoint(x: 10, y: 18))
            checkmarkShapePath.close()
        case .error:
            checkmarkShapePath.move(to: CGPoint(x: 10, y: 10))
            checkmarkShapePath.addLine(to: CGPoint(x: 26, y: 26))
            checkmarkShapePath.move(to: CGPoint(x: 10, y: 26))
            checkmarkShapePath.addLine(to: CGPoint(x: 26, y: 10))
            checkmarkShapePath.move(to: CGPoint(x: 10, y: 10))
            checkmarkShapePath.close()
        case .info:
            checkmarkShapePath.move(to: CGPoint(x: 18, y: 6))
            checkmarkShapePath.addLine(to: CGPoint(x: 18, y: 22))
            checkmarkShapePath.move(to: CGPoint(x: 18, y: 6))
            checkmarkShapePath.close()

            UIColor.white.setStroke()
            checkmarkShapePath.stroke()
            let checkmarkShapePath = UIBezierPath()
            checkmarkShapePath.move(to: CGPoint(x: 18, y: 27))
            checkmarkShapePath.addArc(withCenter: CGPoint(x: 18, y: 27),
                                      radius: 1,
                                      startAngle: 0,
                                      endAngle: CGFloat(Double.pi*2),
                                      clockwise: true)
            checkmarkShapePath.close()

            UIColor.white.setFill()
            checkmarkShapePath.fill()
        case .loading:
            break
        case .text,.toast:
            break
        }

        UIColor.white.setStroke()
        checkmarkShapePath.stroke()
    }

    fileprivate static var imageOfSuccess :UIImage {

        guard HUD.imageOfSuccess == nil else { return HUD.imageOfSuccess! }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWidth_Height,
                                                     height: imageWidth_Height),
                                                     false, 0)
        LCHudImage.draw(.success)
        HUD.imageOfSuccess = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return HUD.imageOfSuccess!
    }

    fileprivate static var imageOfError : UIImage {

        guard HUD.imageOfError == nil else { return HUD.imageOfError! }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWidth_Height,
                                                     height: imageWidth_Height),
                                                     false, 0)
        LCHudImage.draw(.error)
        HUD.imageOfError = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return HUD.imageOfError!
    }

    fileprivate static var imageOfInfo : UIImage {

       guard HUD.imageOfInfo == nil else { return HUD.imageOfInfo! }
       UIGraphicsBeginImageContextWithOptions(CGSize(width: imageWidth_Height,
                                                    height: imageWidth_Height),
                                                    false, 0)
       LCHudImage.draw(.info)
       HUD.imageOfInfo = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       return HUD.imageOfInfo!
    }

}

//TODO: Extension UIView
extension UIView {

    fileprivate func addConstraint(width: CGFloat,height:CGFloat) {
        if width>0 {
            addConstraint(NSLayoutConstraint(item: self,
                                             attribute: .width,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                             multiplier: 1,
                                             constant: width))
        }
        if height>0 {
            addConstraint(NSLayoutConstraint(item: self,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: nil,
                                             attribute: NSLayoutConstraint.Attribute(rawValue: 0)!,
                                             multiplier: 1,
                                             constant: height))
        }
    }

    fileprivate func addConstraint(toCenterX xView:UIView?,toCenterY yView:UIView?) {
        addConstraint(toCenterX: xView, constantx: 0, toCenterY: yView, constanty: 0)
    }

    func addConstraint(toCenterX xView:UIView?,
                       constantx:CGFloat,
                       toCenterY yView:UIView?,
                       constanty:CGFloat) {
        if let xView = xView {
            addConstraint(NSLayoutConstraint(item: xView,
                                             attribute: .centerX,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .centerX,
                                             multiplier: 1, constant: constantx))
        }
        if let yView = yView {
            addConstraint(NSLayoutConstraint(item: yView,
                                             attribute: .centerY,
                                             relatedBy: .equal,
                                             toItem: self,
                                             attribute: .centerY,
                                             multiplier: 1,
                                             constant: constanty))
        }
    }

    fileprivate func addConstraint(to view:UIView,edageInset:UIEdgeInsets) {
         addConstraint(with: view,
                       topView: self,
                       leftView: self,
                       bottomView: self,
                       rightView: self,
                       edgeInset: edageInset)
    }

    fileprivate func addConstraint(with view:UIView,
                       topView:UIView?,
                       leftView:UIView?,
                       bottomView:UIView?,
                       rightView:UIView?,
                       edgeInset:UIEdgeInsets) {
        if let topView = topView {
            addConstraint(NSLayoutConstraint(item: view,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: topView,
                                             attribute: .top,
                                             multiplier: 1,
                                             constant: edgeInset.top))
        }
        if let leftView = leftView {
            addConstraint(NSLayoutConstraint(item: view,
                                             attribute: .left,
                                             relatedBy: .equal,
                                             toItem: leftView,
                                             attribute: .left,
                                             multiplier: 1,
                                             constant: edgeInset.left))
        }
        if let bottomView = bottomView {
            addConstraint(NSLayoutConstraint(item: view,
                                             attribute: .bottom,
                                             relatedBy: .equal,
                                             toItem: bottomView,
                                             attribute: .bottom,
                                             multiplier: 1,
                                             constant: edgeInset.bottom))
        }
        if let rightView = rightView {
            addConstraint(NSLayoutConstraint(item: view,
                                             attribute: .right,
                                             relatedBy: .equal,
                                             toItem: rightView,
                                             attribute: .right,
                                             multiplier: 1,
                                             constant: edgeInset.right))
        }
    }
}

















