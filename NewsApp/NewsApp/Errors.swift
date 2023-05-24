//
//  Errors.swift
//  NewsApp
//
//  Created by Азалия Халилова on 24.05.2023.
//

import UIKit

enum Errors: Error {
    case apiKeyDisabled
    case apiKeyExhausted
    case apiKeyInvalid
    case apiKeyMissing
    case parameterInvalid
    case parametersMissing
    case rateLimited
    case sourcesTooMany
    case sourceDoesNotExist
    case unexpectedError
}
