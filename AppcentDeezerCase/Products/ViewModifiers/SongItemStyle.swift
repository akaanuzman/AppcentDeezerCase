//
//  SongItemStyle.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation
import SwiftUI

struct SongItemStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.pink)
            .cornerRadius(CornerRadius.low.rawValue)
            .padding()
    }
}
