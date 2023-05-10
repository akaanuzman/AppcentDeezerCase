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
    
    init() {
        UINavigationBar.appearance().tintColor = .systemPink
    }
    
    var body: some View {
        let categories : CategoryModel? = categoryViewModel.categories
        if categories != nil {
            /// if the album's data returns empty
            if categories!.data != nil {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns,
                                  spacing: SpacingConstants.gridSpacing) {
                                ForEach(categories!.data!, id: \.id) {
                                    category in
                                    NavigationLink(destination:
                                                    ArtistView(artistViewModel:
                                                    ArtistViewModel(genreId: String(category.id ?? 0)))) {
                                            RectangleImageView(imageUrl: category.picture ?? "",
                                                title: category.name ?? "")
                                        }
                                }
                        }
                    }.padding(.bottom,
                          PaddingConstants.Bottom.high.rawValue)
                    .navigationTitle("")
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

