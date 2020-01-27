//
//  ViewController.swift
//  DraggedCardView
//
//  Created by OMELCHUK Daniil on 16.01.2020.
//  Copyright © 2020 OMELCHUK Daniil. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let dropDownVC = DropDownVC()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Открыть карточку", for: .normal)
        button.addTarget(self, action: #selector(showCardButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var dropDownCard: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    ///Положение верхней границы карточки предстваления
    private var bottomCardViewConstraint: NSLayoutConstraint!
    private var dropDownIsHidden = true
    
    lazy var testView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "Снимок экрана 2020-01-16 в 16.01.56")
        return image
    }()
    
    lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapNavigationbar))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общим списком"
        return label
    }()
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "shape")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        setupGradientNavigationBar()
        setNavigationBar()
        dropDownVC.delegate = self
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        //Положение на экране для нижней границы выпадающего списка
        bottomCardViewConstraint = dropDownCard.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 0)
//        dropDownCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bottomCardViewConstraint.isActive = true
        
//        view.addSubview(testView)
//        testView.frame = CGRect(x: 0, y: 0, width: 500, height: 1)
    }
    
    private func setNavigationBar() {
        titleView.addSubview(titleLabel)
        titleLabel.setPosition(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: titleView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        titleView.addSubview(titleImage)
        titleImage.setPosition(top: titleView.topAnchor, left: titleLabel.rightAnchor, bottom: titleView.bottomAnchor, right: titleView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        navigationItem.titleView = titleView
    }
    
    /// Установка градиента для NavigationBar
    private func setupGradientNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [#colorLiteral(red: 0.9683608413, green: 0.8925672174, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0.9594886899, green: 0.8996667862, blue: 0, alpha: 1).cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 0.7)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            }
        }
    }
    
    /// Получение объекта UIImage из CAGradientLayer
    private func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    private func configureView() {
        
        self.view.addSubview(backImage)
        backImage.setPosition(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(dropDownCard)
        dropDownCard.setPosition(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        addChild(dropDownVC)
        dropDownVC.didMove(toParent: self)
        dropDownCard.addSubview(dropDownVC.view)
        dropDownVC.view.setPosition(top: dropDownCard.topAnchor, left: dropDownCard.leftAnchor, bottom: dropDownCard.bottomAnchor, right: dropDownCard.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }

    @objc func showCardButtonTapped() {
//        let card = CardViewController()
//        card.modalPresentationStyle = .overCurrentContext
//        card.modalPresentationStyle = .custom
//        self.present(card, animated: true, completion: nil)
        
        let card = CardViewVC()
        card.modalPresentationStyle = .custom
        card.transitioningDelegate = self
        self.present(card, animated: true, completion: nil)
    }
    
    @objc func tapNavigationbar() {
        dropDownIsHidden = !dropDownIsHidden
        dropDownIsHidden ? showCardAnimation() : hideCardAnimations()
    }
    
    // MARK: - Анимация
    
    ///Анимация появления выпадающего списка с необходимой информацией
    private func showCardAnimation() {
        
        //Убеждаемся что перед запуском анимации нету ожидающих изменений для отрисовки view
        self.view.layoutIfNeeded()
        
        bottomCardViewConstraint.constant = bottomCardViewConstraint.constant + dropDownCard.layer.bounds.height
        
        //Задаем анимацию для перемещения карточки вверх и обновляем представления для view
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.titleImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.view.layoutIfNeeded()
        })
        
        showCard.startAnimation()
    }
    
    ///Анимация закрытия карточки
    private func hideCardAnimations() {
        
        self.view.layoutIfNeeded()
        
        bottomCardViewConstraint.constant = 0
        
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn) {
            self.titleImage.transform = CGAffineTransform(rotationAngle: CGFloat(2 * Double.pi))
            self.view.layoutIfNeeded()
        }
        
        hideCard.startAnimation()
    }
    
    
}

extension ViewController: SelectDropDownMenu {
    
    func select(index: Int) {
        print("Выбран индекс - \(index)")
        hideCardAnimations()
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitionPresentBottomCard(duration: 3.0)
    }
}
