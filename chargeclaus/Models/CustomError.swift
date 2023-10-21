//
//  CustomError.swift
//  chargeclaus
//
//  Created by Roman Zuchowski on 21.10.23.
//

import Foundation

enum ChargeclausError: Error {
    case firestoreError
    case decodingError
    case unexpected(code: Int)
}

extension ChargeclausError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .firestoreError:
            return NSLocalizedString(
                "An error occured while retreiving the data from Firebase.",
                comment: "Firebase connection error"
            )
        case .decodingError:
            return NSLocalizedString(
                "The retreived data could not be decoded.",
                comment: "Decoding Error"
            )
        case .unexpected(_):
            return NSLocalizedString(
                "An unexpected error occurred.",
                comment: "Unexpected Error"
            )
        }
    }
}
