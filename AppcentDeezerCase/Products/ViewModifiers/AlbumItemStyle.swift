//
//  AlbumItemStyle.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation
import SwiftUI

struct AlbumItemStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.pink) // list item bg color
            .listRowInsets(EdgeInsets()) // remove list padding
    }
}
