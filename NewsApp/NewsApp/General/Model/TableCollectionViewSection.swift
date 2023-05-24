//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Азалия Халилова on 12.05.2023.
//

import Foundation

protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
