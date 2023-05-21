//
//  NewsDeatilViewController.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 22.04.2023.
//

import UIKit

class NewsDeatilViewController: UIViewController {
    //MARK: - Vars
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = .max
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = .max
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
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
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        title = "Новость"
        addViews()
        configureData()
    }
    
    func configureData() {
        if let news = news {
            titleLabel.text = news.title
            descriptionLabel.text = news.description
            dateLabel.text = news.publishedDate.formatted(date: .complete, time: .standard)
            if let titleImageUrl = news.titleImageUrl {
                imageView.load(url: titleImageUrl)
            }
        }
    }
    
    func addViews(){
        self.view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(dateLabel)
        
        titleLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 20).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
//
//        titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
//        titleLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
////
//        imageView.leftAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
//        imageView.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
//        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        
//        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
//        descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
//        descriptionLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
//
        dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
//        dateLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
//        dateLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
//
    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        self.view.layoutIfNeeded()
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.view.frame = UIScreen.main.bounds
//        self.view.layoutIfNeeded()
//    }
    
}
