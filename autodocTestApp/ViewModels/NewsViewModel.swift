//
//  NewsViewModel.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 16.04.2023.
//

import Foundation
import UIKit

class NewsViewModel {
    @Published var news: [News] = []
    @Published var totalPages = 1
    @Published var newsPerPage = 10
    @Published var currentPage = 1
    
    func loadData() {
        Task {
            do {
                let data = try await NetworkManager.shared.getNews(page: currentPage, count: newsPerPage)
                news = data.0
                totalPages = data.1 / newsPerPage
            } catch {
                print(error)
            }
        }
    }
    
    
//    func loadImage(url: URL) async -> UIImage? {
//        let someTask = Task { () -> UIImage? in
//            do {
//                let image = try await NetworkManager.shared.getImage(url: url)
//                return image
//            } catch {
//               return nil
//            }
//        }
//        
//        return await someTask.value
//    }
    
}


