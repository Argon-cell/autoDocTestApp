//
//  NewsCollectionViewController.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 20.04.2023.
//

import UIKit
import Combine

class NewsCollectionViewController: UICollectionViewController {
    //MARK: - Vars
    private let cellId = "newsCell"
    private var cancellables = Set<AnyCancellable>()
    var newsViewModel: NewsViewModel!
    
    //MARK: - Inits
    init() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight( UIDevice.current.userInterfaceIdiom == .phone ? 0.43 : 0.55))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        super.init(collectionViewLayout: layout)
//        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        title = "Cписок новостей"
        self.collectionView.backgroundColor = .systemGray5
        linkPublishers()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCollectionViewCell
        
        collectionViewCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCell(_:))))
        collectionViewCell.label.text = newsViewModel.news[indexPath.row].title
        
        if let titleImageUrl = newsViewModel.news[indexPath.row].titleImageUrl {
            collectionViewCell.imageView.load(url: titleImageUrl)
//            collectionViewCell.imageView.image = await newsViewModel.loadImage(url: titleImageUrl)
        } else {
            collectionViewCell.imageView.image = nil
        }
        
        
        return collectionViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsViewModel.news.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = .identity
        }
    }
    
    //MARK: - Functions
    private func linkPublishers() {
        newsViewModel
            .$news
            .receive(on: RunLoop.main)
            .sink { values in
                self.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    @objc func tapCell(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)

        if let index = indexPath {
            let newsDetailViewController = NewsDeatilViewController()
            newsDetailViewController.news = newsViewModel.news[index.row]
            self.navigationController?.pushViewController(newsDetailViewController, animated: true)
            
        }
    }
}
