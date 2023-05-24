//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Азалия Халилова on 08.05.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
