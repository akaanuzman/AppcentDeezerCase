//
//  AlbumView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI
import Kingfisher

struct CategoryView: View {
    @StateObject var categoryViewModel : CategoryViewModel = CategoryViewModel()
    
    var body: some View {
        let categories : CategoryModel? = categoryViewModel.categories
        if categories != nil {
            /// if the album's data returns empty
            if categories!.data != nil {
                VStack {
                    Title3BoldPinkText(title: LocaleKeys.categories.locale())
                    GridView(categories: categories!)
                }.padding(.bottom,
                          PaddingConstants.Bottom.high.rawValue)
            }
        } else {
           CircleProgressView()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

/// MARK: MAKE COMPONENT
private struct GridView: View {
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    let categories : CategoryModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns,spacing: SpacingConstants.gridSpacing) {
                ForEach(categories.data!, id: \.id) {
                    category in
                    RectangleImageView(imageUrl: category.picture ?? "",
                                       title: category.name ?? "")
                }
            }
        }
    }
}
