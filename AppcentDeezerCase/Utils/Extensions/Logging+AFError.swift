//
//  Logging+AFError.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import Alamofire
import Logging

extension AFError {
    private static let logger = Logger(label: "")
    
    func showError() {
        AFError.logger.error("\(errorDescription?.description ?? "")")
    }
}
