//
//  DropDownVC.swift
//  DraggedCardView
//
//  Created by OMELCHUK Daniil on 17.01.2020.
//  Copyright © 2020 OMELCHUK Daniil. All rights reserved.
//

import Foundation

import UIKit

private let cellIdentifier = "DropDownCell"

protocol SelectDropDownMenu {
    
    func select(index: Int)
}

class DropDownVC: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    lazy var blurEffect: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blur)
        blurredEffectView.isHidden = false
        blurredEffectView.alpha = 0.95
        return blurredEffectView
    }()
    
    var delegate: SelectDropDownMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DropDownCell.self, forCellReuseIdentifier: cellIdentifier)
        setupTableView()
    }
    
    /// Установка UITableView
    private func setupTableView() {
        
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        
        self.view.addSubview(blurEffect)
        blurEffect.setPosition(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        self.view.addSubview(tableView)
        
        setupConstraints()
    }
    
    /// Установка Constraint для UITableView
    private func setupConstraints() {
        
        tableView.setPosition(top: view.topAnchor,
                              left: view.leftAnchor,
                              bottom: view.bottomAnchor,
                              right: view.rightAnchor,
                              paddingTop: 0,
                              paddingLeft: 0,
                              paddingBottom: 0,
                              paddingRight: 0,
                              width: 0,
                              height: 0)
    }
}

// MARK: - Data Source Extension
extension DropDownVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DropDownCell
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.select(index: indexPath.row)
    }
}
