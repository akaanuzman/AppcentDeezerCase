//
//  String+ToLocalize.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 9.05.2023.
//

import SwiftUI

extension String {
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
