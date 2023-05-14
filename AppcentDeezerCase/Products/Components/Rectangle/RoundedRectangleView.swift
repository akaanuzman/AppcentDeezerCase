//
//  ImageRectangleView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct RoundedRectangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: WidthSize.imageAndRectangleWidth.rawValue,
                   height: HeightSize.rectangle.rawValue)
            .foregroundColor(.pink)
            .cornerRadius(CornerRadius.large.rawValue)
    }
}
