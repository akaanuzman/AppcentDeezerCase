//
//  AlbumView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import Kingfisher
import SwiftUI

struct CategoryView: View {
    @StateObject var categoryViewModel: CategoryViewModel = .init()
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 200))]

    var body: some View {
        let categoryModel: CategoryModel? = categoryViewModel.categories
        if let category = categoryModel {
            /// if the album's data returns empty
            if let categoryData = category.data {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(categoryData, id: \.id) {
                                category in
                                NavigationLink(destination:
                                    ArtistsView(artistsViewModel:
                                        ArtistsViewModel(genreId: String(category.id ?? 0)),
                                        categoryName: category.name ?? ""))
                                {
                                    ImageCardView(imageUrl: category.picture ?? "",
                                                  title: category.name ?? "")
                                }
                            }
                        }
                    }
                    .modifier(ToolbarAndBottomPadding(title: LocaleKeys.categories.rawValue))
                        .navigationTitle("") // hide back button's text
                }.modifier(FontStyle())
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
