//
//  GridView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct GridView<T>: View {
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    var model : T
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns,spacing: SpacingConstants.gridSpacing) {
                ForEach(model.data!, id: \.id) {
                    item in
                    RectangleImageView(imageUrl: item.picture ?? "",
                                       title: item.name ?? "")
                }
            }
        }
    }
}
