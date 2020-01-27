//
//  MyCustomTransition.swift
//  DraggedCardView
//
//  Created by OMELCHUK Daniil on 27.01.2020.
//  Copyright © 2020 OMELCHUK Daniil. All rights reserved.
//

import UIKit

class CustomTransitionPresentBottomCard: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval
    ///Положение верхней границы карточки предстваления
    private var topCardViewConstraint: NSLayoutConstraint!
    
    init(duration: TimeInterval = 3.0) {
        self.duration = duration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
              let toVC = transitionContext.viewController(forKey: .to),
            let toView = transitionContext.view(forKey: .to)  else { return }
        
        let container = transitionContext.containerView
        container.addSubview(toView)
        
        toView.frame = CGRect(x: 0, y: 0, width: fromVC.view.frame.width, height: 0)
        toVC.view.setPosition(top: nil, left: fromVC.view.leftAnchor, bottom: nil, right: fromVC.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        topCardViewConstraint = toView.topAnchor.constraint(equalTo: fromVC.view.safeAreaLayoutGuide.topAnchor, constant: fromVC.view.safeAreaLayoutGuide.layoutFrame.size.height + fromVC.view.safeAreaInsets.bottom)
        toView.heightAnchor.constraint(equalToConstant: fromVC.view.safeAreaLayoutGuide.layoutFrame.size.height).isActive = true
        topCardViewConstraint.isActive = true
        
//        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, delay: 0, options: [], animations: {
            self.topCardViewConstraint.constant = (fromVC.view.safeAreaLayoutGuide.layoutFrame.size.height + fromVC.view.safeAreaInsets.bottom) / 2

            toView.layoutIfNeeded()
        }) { (result) in
            transitionContext.completeTransition(result)
        }
    }
}
