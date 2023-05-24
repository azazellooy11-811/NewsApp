//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Азалия Халилова on 23.05.2023.
//

import UIKit

final class TechnologyViewModel: NewsListViewModel {
    // MARK: - Methods
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        ApiManager.getNews(from: .technology, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
