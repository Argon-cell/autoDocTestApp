//
//  NetworkManager.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 12.04.2023.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    var session = URLSession.shared
    
    private let urlString = "https://webapi.autodoc.ru/api/news/"
    
    func getNews(page: Int, count: Int) async throws -> ([News], Int) {
        let pathTo = "\(page)/\(count)"
        
        let (data, _) = try await session.data(from: URL(string: urlString + pathTo)!)
        do {
            let formatter = DateFormatter()
            let decoder = JSONDecoder()
            
            decoder.dateDecodingStrategy = .formatted(formatter.defaultFormat())
            
            let fetchedData = try decoder.decode(NewsContainer.self, from: data)

            return (fetchedData.news, fetchedData.totalNews)
        } catch is DecodingError {
            return ([], 0)
        }
        
    }
    
//    func getImage(url: URL) async throws -> UIImage? {
//        let (data, _) = try await session.data(from: url)
//        do {
//            return UIImage(data: data)
//        } catch {
//            return nil
//        }
//    }    
}


