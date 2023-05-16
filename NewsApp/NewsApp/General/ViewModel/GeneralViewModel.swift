//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by Азалия Халилова on 06.05.2023.
//

import Foundation

final class GeneralViewModel: NewsListViewModel {
    
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        ApiManager.getNews(from: .general, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
