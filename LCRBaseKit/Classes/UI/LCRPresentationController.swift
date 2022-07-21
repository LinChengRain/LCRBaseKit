//
//  LCRPresentationController.swift
//  Practice
//
//  Created by yuchanglin on 2021/2/20.
//  Copyright © 2021 yuchanglin. All rights reserved.
//

import UIKit

public let dimmingFromNotification = Notification.Name(rawValue: "dimmingFromNotification")

public class LCRPresentationController: UIPresentationController,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    /** 黑色半透明背景 */
    private var dimmingView:UIView!
    
    //MARK: - UIViewControllerTransitioningDelegate
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return self
    }
    
    //MARK: - UIViewControllerAnimatedTransitioning
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionContext!.isAnimated ? 0.35:0
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1.获取源控制器、目标控制器、动画容器View
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
//        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let containerView = transitionContext.containerView
        
        // 2. 获取源控制器、目标控制器 的View，但是注意二者在开始动画，消失动画，身份是不一样的：
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        if toView != nil {
            containerView.addSubview(toView!)
        }
        
        let isPresenting = fromViewController == self.presentingViewController
        
        let screenW = containerView.bounds.size.width
        let screenH = containerView.bounds.size.height
        
        // 屏幕顶部：
        let x:CGFloat = 0
        let w = screenW
        let h = screenH - AppFrame.W_Height_NavBar
        
        // 屏幕中间：
        let topFrame = CGRect(x: x, y: AppFrame.W_Height_NavBar, width: w, height: h)
        // 屏幕底部
        let bottomFrame = CGRect(x: x, y: screenH, width: w, height: h)
        
        if (isPresenting) {
            toView?.frame = bottomFrame
        }
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: transitionDuration) {
            if (isPresenting) {
                toView?.frame = topFrame
            } else {
                fromView?.frame = bottomFrame
            }
        } completion: { (finished) in
            let wasCancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCancelled)
        }
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
   public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        presentedViewController.modalPresentationStyle = .custom
        
        NotificationCenter.default.addObserver(self, selector: #selector(dimmingViewTapped(_:)), name: dimmingFromNotification, object: nil)
    }
    
    
   public override func presentationTransitionWillBegin() {
        // 背景遮罩
        let dimmingView = UIView(frame: self.containerView!.bounds)
        dimmingView.backgroundColor = UIColor.black
        dimmingView.isOpaque = false //是否透明
        dimmingView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped(_:))))
        self.dimmingView = dimmingView
        self.containerView?.addSubview(dimmingView) // 添加到动画容器View中。
        
        let animations = {
            self.dimmingView.alpha = 0.4
        }
        // 动画期间，背景View的动画方式
        self.dimmingView.alpha = 0.0
        // 获取presentingViewController 的转换协调器，应该动画期间的一个类？上下文？之类的，负责动画的一个东西
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator {
            
            transitionCoordinator.animate(alongsideTransition: { _ in
                animations()
            }, completion: nil)
        } else {
            animations()
        }
    }
    
    public override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            self.dimmingView = nil
        }
    }
    
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            self.dimmingView.removeFromSuperview()
            self.dimmingView = nil
        }
    }
    
    public override func dismissalTransitionWillBegin() {
        
        let transitionCoordinator = self.presentingViewController.transitionCoordinator;
        
        transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    
    public override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        super.preferredContentSizeDidChange(forChildContentContainer: container)
        if (container as! NSObject == self.presentedViewController) {
            self.containerView?.setNeedsLayout()
        }
    }
    
    public override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        if (container as! NSObject == self.presentedViewController) {
            return (container as! UIViewController).preferredContentSize;
        } else {
            return super.size(forChildContentContainer: container, withParentContainerSize: parentSize)
        }
    }
    
    public override var frameOfPresentedViewInContainerView: CGRect {
        
        let containerViewBounds = self.containerView!.bounds
        let presentedViewContentSize = self.size(forChildContentContainer: self.presentingViewController, withParentContainerSize: containerViewBounds.size)
        
        var presentedViewControllerFrame = containerViewBounds
        presentedViewControllerFrame.size.height = presentedViewContentSize.height
        presentedViewControllerFrame.origin.y = containerViewBounds.maxY - presentedViewContentSize.height;
        return presentedViewControllerFrame
        
    }
    
    public override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        self.dimmingView.frame = self.containerView!.bounds
    }
    
    // MARK: Private
    //MARK: - 点击了背景遮罩view
    @objc
    private func dimmingViewTapped(_ sender:UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}
