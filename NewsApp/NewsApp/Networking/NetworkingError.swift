//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Азалия Халилова on 08.05.2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
