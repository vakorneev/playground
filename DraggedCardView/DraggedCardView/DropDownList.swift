//
//  DropDownList.swift
//  DraggedCardView
//
//  Created by OMELCHUK Daniil on 17.01.2020.
//  Copyright © 2020 OMELCHUK Daniil. All rights reserved.
//

import UIKit

class DropDownList: UIViewController {
    
    // MARK: - UI свойства
    
    lazy var dropDownCard: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.alpha = 0.5
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    ///Положение верхней границы карточки предстваления
    private var bottomCardViewConstraint: NSLayoutConstraint!
    
    // MARK: - Инициализация UI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureView()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        //Положение на экране для нижней границы выпадающего списка
        let constant = view.safeAreaInsets.top + 44
        bottomCardViewConstraint = dropDownCard.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
        dropDownCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bottomCardViewConstraint.isActive = true
        
//        view.addSubview(titleView)
//        titleView.frame = CGRect(x: 0, y: constant, width: 500, height: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        showCardAnimation()
    }
    
    private func configureView() {
        
        self.view.addSubview(dropDownCard)
        dropDownCard.setPosition(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    // MARK: - Анимация
    
    ///Анимация появления выпадающего списка с необходимой информацией
    private func showCardAnimation() {
        
        //Убеждаемся что перед запуском анимации нету ожидающих изменений для отрисовки view
        self.view.layoutIfNeeded()
        
        bottomCardViewConstraint.constant = bottomCardViewConstraint.constant + 100
        
        //Задаем анимацию для перемещения карточки вверх и обновляем представления для view
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
        
        showCard.startAnimation()
    }
    
    ///Анимация закрытия карточки
    private func hideCardAnimations() {
        
        self.view.layoutIfNeeded()
        
        bottomCardViewConstraint.constant = view.safeAreaInsets.top + 44
        
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn) {
            self.view.layoutIfNeeded()
        }
        
        //Когда анимация закончилась выполняем dismiss
        hideCard.addCompletion { (position) in
            if position == .end {
                //Проверяем что есть куда возвращаться (Есть контроллер который вызвал текущий)
                if(self.presentingViewController != nil) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        }
        
        hideCard.startAnimation()
    }
    
    @objc func goBack() {
        hideCardAnimations()
    }

}
