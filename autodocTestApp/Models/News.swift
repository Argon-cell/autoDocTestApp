//
//  News.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 12.04.2023.
//

import Foundation

struct News: Decodable {
    var id: Int
    var title: String
    var description: String
    var publishedDate: Date
    /* В некоторых новостях русские буквы вместе с латинскими крашается */
    var url: URL?
    var fullUrl: URL?
    var titleImageUrl: URL?
    var categoryType: CategoryNews
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case publishedDate
        case url
        case fullUrl
        case titleImageUrl
        case categoryType
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        publishedDate = try container.decode(Date.self, forKey: .publishedDate)
        url = try? container.decode(URL.self, forKey: .url)
        fullUrl = try? container.decode(URL.self, forKey: .fullUrl)
        titleImageUrl = try? container.decode(URL.self, forKey: .titleImageUrl)
        categoryType = try container.decode(CategoryNews.self, forKey: .categoryType)
    }
}

struct NewsContainer: Decodable {
    let news: [News]
    let totalNews: Int

    enum CodingKeys: String, CodingKey {
        case news
        case totalCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        news = try container.decode([News].self, forKey: .news)
        totalNews = try container.decode(Int.self, forKey: .totalCount)
    }
}
