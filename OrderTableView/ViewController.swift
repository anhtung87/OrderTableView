//
//  ViewController.swift
//  OrderTableView
//
//  Created by Hoang Tung on 1/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let orderTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var orderList: [Order]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configTable()
        setData()
    }

    func setupLayout() {
        view.addSubview(orderTableView)
        orderTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        orderTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        orderTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        orderTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func configTable() {
        orderTableView.delegate = self
        orderTableView.dataSource = self
    }
    
    func setData() {
        orderList = [
            Order(image: UIImage(named: "giay1")!, name: "Giày 1", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", price: "142$"),
            Order(image: UIImage(named: "giay2")!, name: "Giày 2", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", price: "87$"),
            Order(image: UIImage(named: "giay3")!, name: "Giày 3", detail: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", price: "41$"),
        ]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrderTableViewCell()
        cell.information = orderList![indexPath.row]
        return cell
    }
}
