//
//  PaybeforePresentViewController.swift
//  B7iOSBuyer
//
//  Created by linhey on 2018/4/27.
//  Copyright © 2018年 com.spzjs.b7iosbuy. All rights reserved.
//

import UIKit
import Then
import FHXColorAndFont
import SnapKit

public class PresentViewController: UIViewController {
  
  /// 禁止旋转
  override public var shouldAutorotate: Bool{ return false }
  
  let contentView = UIControl().then { (item) in
    item.layer.cornerRadius = 6
    item.layer.masksToBounds = true
    item.backgroundColor = Color.white
  }
  
  let titleLabel = UILabel().then { (item) in
    item.font = Font.font14
    item.textColor = Color.textBlack
  }
  
  let doneBtn = UIButton(type: .custom).then { (item) in
    item.setBackgroundColor(color: Color.theme, for: .normal)
    item.setBackgroundColor(color: Color.nonActivated, for: .disabled)
    item.layer.cornerRadius = 2
    item.layer.masksToBounds = true
    item.setTitleColor(Color.white, for: .normal)
    item.titleLabel?.font = Font.font14
  }
  
  fileprivate let closeBtn = UIControl()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    self.transitioningDelegate = self
    self.modalTransitionStyle = .crossDissolve
    self.modalPresentationStyle = .overCurrentContext
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Color.clear
    buildSubview()
    buildLayout()
  }
  
  @objc func done() {
    
  }
  
}


extension PresentViewController {
  
  @objc fileprivate func close() {
    self.dismiss(animated: true, completion: nil)
  }
  
}


extension PresentViewController {
  
  fileprivate func buildSubview() {
    closeBtn.addTarget(self, action: #selector(close), for: .touchUpInside)
    doneBtn.addTarget(self, action: #selector(done), for: .touchUpInside)
  }
  
  fileprivate func buildLayout() {
    view.addSubview(closeBtn)
    view.addSubview(contentView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(doneBtn)
    
    closeBtn.snp.makeConstraints { (make) in
      make.bottom.top.left.right.equalToSuperview()
    }
    
    contentView.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview()
      make.bottom.equalToSuperview().offset(0)
      make.height.equalTo(420)
    }
    
    titleLabel.snp.makeConstraints { (make) in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().offset(18)
      make.height.equalTo(14)
    }
    
    doneBtn.snp.makeConstraints { (make) in
      make.bottom.equalToSuperview().offset(-15)
      make.left.equalToSuperview().offset(15)
      make.right.equalToSuperview().offset(-15)
      make.height.equalTo(49)
    }
  }
  
}

extension PresentViewController: UIViewControllerTransitioningDelegate{
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentTransitioning()
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentTransitioning()
  }
  
}


