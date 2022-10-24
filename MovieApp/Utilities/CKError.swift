//
//  CKError.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import Foundation

enum CKError: String, Error {
    case urlError = "URL Error."
    case invalidResponse = "Invalid url response!"
    case invalidData = "Invaild data!"
    case decodeError = "Error occurred whilde decoding!"
}
