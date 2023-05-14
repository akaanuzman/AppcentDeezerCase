//
//  PagePaddingAndToolBar.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation
import SwiftUI

struct ToolbarAndBottomPadding: ViewModifier {
    let title: String

    func body(content: Content) -> some View {
        content
            .padding(.bottom,
                     PaddingConstants.Bottom.high.rawValue)
            // for app bar title exp: (Artists)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Title3BoldPinkText(title: title.locale())
                }
            }
    }
}
