//
//  FavListModif.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 14.05.2023.
//

import Foundation
import SwiftUI

struct FavListModif: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(ToolbarAndBottomPadding(title: LocaleKeys.favList.rawValue))
            .navigationTitle("")
    }
}

