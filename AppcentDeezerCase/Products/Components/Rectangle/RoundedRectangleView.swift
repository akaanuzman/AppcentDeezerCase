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
            .frame(width: WidthSize.imageAndRectangleWidth,
                   height: HeightSize.rectangleHeight)
            .foregroundColor(.pink)
            .cornerRadius(CornerRadius.large)
    }
}
