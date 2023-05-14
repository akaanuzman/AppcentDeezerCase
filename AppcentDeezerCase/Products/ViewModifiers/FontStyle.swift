//
//  FontStyle.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation
import SwiftUI

struct FontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
                .bold()
                .foregroundColor(.white)
                .accentColor(.pink) // for back button color
    }
}
