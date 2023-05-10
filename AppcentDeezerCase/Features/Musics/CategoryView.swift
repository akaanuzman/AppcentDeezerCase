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
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    
    var body: some View {
        let categories : CategoryModel? = categoryViewModel.categories
        if categories != nil {
            /// if the album's data returns empty
            if categories!.data != nil {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                                ForEach(categories!.data!, id: \.id) {
                                    category in
                                    NavigationLink(destination:
                                                    ArtistsView(artistsViewModel:
                                                                    ArtistsViewModel(genreId: String(category.id ?? 0)),
                                                                categoryName: category.name ?? "")) {
                                        ImageCardView(imageUrl: category.picture ?? "",
                                                title: category.name ?? "")
                                        }
                                }
                        }
                    }.padding(.bottom,
                          PaddingConstants.Bottom.high.rawValue)
                    .navigationTitle("")  // hide back button's text
                    // for app bar title exp: (Artists)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Title3BoldPinkText(title: LocaleKeys.categories.locale())
                        }
                    }
                }.font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .accentColor(.pink) // for back button color
                    
                    
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
