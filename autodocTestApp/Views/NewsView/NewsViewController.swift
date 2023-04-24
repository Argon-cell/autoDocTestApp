//
//  NewsViewController.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 22.04.2023.
//

import UIKit
import Combine

class NewsViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Предыдущая", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Следующая", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
//        label.text = "1/20 cтр."
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionViewController: NewsCollectionViewController!
    var newsViewModel: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        title = "Список новостей"
        newsViewModel = NewsViewModel()
        linkPublishers()
        collectionViewController = NewsCollectionViewController()
        collectionViewController.newsViewModel = newsViewModel
        newsViewModel.loadData()
    }
    
    private func linkPublishers() {
        newsViewModel
            .$totalPages
            .receive(on: RunLoop.main)
            .sink { values in
                self.label.text = "\(self.newsViewModel.currentPage)/\(values) стр."
            }
            .store(in: &cancellables)
    }

    override func viewWillAppear(_ animated: Bool) {
        let collectionView = collectionViewController.view!
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.add(collectionViewController)

        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -90).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        
        self.view.addSubview(previousButton)
        self.view.addSubview(nextButton)
        self.view.addSubview(label)
        
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.collectionViewController.view.bottomAnchor, constant: 25).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        previousButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        previousButton.topAnchor.constraint(equalTo: self.collectionViewController.view.bottomAnchor, constant: 15).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        previousButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        previousButton.addTarget(self, action: #selector(previousTapAction), for: .touchUpInside)
        
        nextButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        nextButton.topAnchor.constraint(equalTo: self.collectionViewController.view.bottomAnchor, constant: 15).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        nextButton.addTarget(self, action: #selector(nextTapAction), for: .touchUpInside)
        
    }
    
    @objc func nextTapAction() {
        if newsViewModel.currentPage < newsViewModel.totalPages {
            newsViewModel.currentPage += 1
            newsViewModel.loadData()
        }
    }
    
    @objc func previousTapAction() {
        if newsViewModel.currentPage > 1 {
            newsViewModel.currentPage -= 1
            newsViewModel.loadData()
        }
    }
}


