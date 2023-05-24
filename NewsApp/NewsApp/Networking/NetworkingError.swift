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
//    case apiKeyDisabled
//    case apiKeyExhausted
//    case apiKeyInvalid
//    case apiKeyMissing
//    case parameterInvalid
//    case parametersMissing
//    case rateLimited
//    case sourcesTooMany
//    case sourceDoesNotExist
//    case unexpectedError
}
