//
//  CardViewVC.swift
//  DraggedCardView
//
//  Created by OMELCHUK Daniil on 16.01.2020.
//  Copyright © 2020 OMELCHUK Daniil. All rights reserved.
//

import UIKit

class CardViewVC: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    let arrowImage: UIImageView = {
        let image = UIImageView()
        
        image.image = #imageLiteral(resourceName: "shape")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
    }
    
    /// Установка UITableView
    private func setupTableView() {
        
        view.roundCorners(cornerRadius: 20)
        
        tableView.backgroundColor = .blue
        tableView.isScrollEnabled = false
        
        view.addSubview(arrowImage)
        arrowImage.setPosition(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        arrowImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    /// Установка Constraint для UITableView
    private func setupConstraints() {
        
        tableView.setPosition(top: arrowImage.bottomAnchor,
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
extension CardViewVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
