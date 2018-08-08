//
//  PresentTransitioning.swift
//  B7iOSBuyer
//
//  Created by linhey on 2018/5/11.
//  Copyright © 2018年 com.spzjs.b7iosbuy. All rights reserved.
//

import UIKit

class PresentTransitioning: NSObject,UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let toVC = transitionContext.viewController(forKey: .to) else { return }
    let containerView = transitionContext.containerView
    let fromView = transitionContext.view(forKey: .from)
    let toView = transitionContext.view(forKey: .to)
    let isPresenting = toView != nil
    containerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    let endFrame = transitionContext.finalFrame(for: toVC)
    let startFrame = endFrame.offsetBy(dx: 0, dy: endFrame.height)
    
    if isPresenting, let view = toView {
      view.frame = startFrame
      view.alpha = 0
      containerView.addSubview(view)
    }else {
      
    }
    
    UIView.animate(withDuration: transitionDuration(using: transitionContext),
                   delay: 0,
                   animations: {
                    if isPresenting {
                      UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: 7)!)
                      toView?.frame = endFrame
                      toView?.alpha = 1
                    }else{
                      UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
                      fromView?.frame = startFrame
                      fromView?.alpha = 0
                    }
    },
                   completion: { (_) in
                    if transitionContext.transitionWasCancelled {
                      toView?.removeFromSuperview()
                    }
                    transitionContext.completeTransition(true)
    })
  }
  
}
