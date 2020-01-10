//
//  OrderTableViewCell.swift
//  OrderTableView
//
//  Created by Hoang Tung on 1/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

var fontSize: CGFloat = 14

class OrderTableViewCell: UITableViewCell {
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = .boldSystemFont(ofSize: fontSize)
        name.textColor = .black
        name.numberOfLines = 0
        return name
    }()
    
    let productPriceLabel: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = .boldSystemFont(ofSize: fontSize)
        price.textColor = .systemRed
        return price
    }()
    
    let productDetailLabel: UILabel = {
        let detail = UILabel()
        detail.translatesAutoresizingMaskIntoConstraints = false
        detail.font = .systemFont(ofSize: fontSize)
        detail.textColor = .systemGray
        detail.numberOfLines = 0
        return detail
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.backgroundColor = .systemBlue
        label.textColor = .white
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var amount: Int = 0
    
    var information: Order? {
        didSet {
            if let data = information {
                productImageView.image = data.image
                productNameLabel.text = data.name
                productDetailLabel.text = data.detail
                productPriceLabel.text = data.price
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setupLayout()
    }

    func setupLayout() {
        self.addSubview(productImageView)
        productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        productImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
        productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor, multiplier: 1).isActive = true
        productImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8).isActive = true
        
        self.addSubview(productNameLabel)
        productNameLabel.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 0).isActive = true
        productNameLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        productNameLabel.heightAnchor.constraint(equalToConstant: fontSize * 1.33).isActive = true
        
        self.addSubview(productDetailLabel)
        productDetailLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8).isActive = true
        productDetailLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 8).isActive = true
        productDetailLabel.trailingAnchor.constraint(equalTo: productNameLabel.trailingAnchor).isActive = true
        productDetailLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        self.addSubview(productPriceLabel)
        productPriceLabel.topAnchor.constraint(equalTo: productDetailLabel.bottomAnchor, constant: 8).isActive = true
        productPriceLabel.leadingAnchor.constraint(equalTo: productDetailLabel.leadingAnchor).isActive = true
        productPriceLabel.trailingAnchor.constraint(equalTo: productDetailLabel.trailingAnchor).isActive = true
        productPriceLabel.heightAnchor.constraint(equalToConstant: fontSize * 1.33).isActive = true
        
        self.addSubview(minusButton)
        minusButton.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 8).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: productPriceLabel.leadingAnchor, constant: 0).isActive = true
        minusButton.widthAnchor.constraint(equalTo: productPriceLabel.heightAnchor, multiplier: 1.5).isActive = true
        minusButton.heightAnchor.constraint(equalTo: productPriceLabel.heightAnchor, multiplier: 1.5).isActive = true
        minusButton.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8).isActive = true
        
        self.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: minusButton.topAnchor, constant: 0).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 0).isActive = true
        amountLabel.widthAnchor.constraint(equalTo: minusButton.widthAnchor, constant: 0).isActive = true
        amountLabel.heightAnchor.constraint(equalTo: minusButton.widthAnchor, constant: 0).isActive = true
        
        self.addSubview(plusButton)
        plusButton.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: 0).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 0).isActive = true
        plusButton.widthAnchor.constraint(equalTo: amountLabel.widthAnchor, constant: 0).isActive = true
        plusButton.heightAnchor.constraint(equalTo: amountLabel.widthAnchor, constant: 0).isActive = true

        plusButton.addTarget(self, action: #selector(increaseAmount), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decreaseAmount), for: .touchUpInside)
    }
    
    @objc func increaseAmount() {
        self.amount += 1
        amountLabel.text = String(self.amount)
    }
    
    @objc func decreaseAmount() {
        if self.amount > 0 {
            self.amount -= 1
            amountLabel.text = String(self.amount)
        }
    }
}
