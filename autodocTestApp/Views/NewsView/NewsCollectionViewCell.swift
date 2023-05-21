//
//  NewsCollectionViewCell.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 20.04.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    //MARK: - Vars
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: ScaledHeightImageView = {
        let imageView = ScaledHeightImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
//        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 10
        self.contentView.contentMode = .top
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Functions
    
    func addViews(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(imageView)
        contentView.addSubview(stackView)
        
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
    }
    
}



