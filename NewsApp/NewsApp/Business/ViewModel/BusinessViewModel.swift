//
//  BusinessViewModel.swift
//  NewsApp
//
//  Created by Азалия Халилова on 11.05.2023.
//

import Foundation

final class BusinessViewModel: NewsListViewModel {
    // MARK: - Methods
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        ApiManager.getNews(from: .business, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
    
    override func convertToCellViewModel(_ articles: [ArticleResponseObject]) {
        var viewModels = articles.map { ArticleCellViewModel(article: $0)}
        if sections.isEmpty {
            let firstSection = TableCollectionViewSection(items: [viewModels.removeFirst()])
            let secondSection = TableCollectionViewSection(items: viewModels)
            sections = [firstSection, secondSection]
        } else {
            sections[1].items += viewModels
        }
    }
}
