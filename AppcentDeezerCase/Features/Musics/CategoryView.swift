//
//  AlbumView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI
import Kingfisher

struct CategoryView: View {
    @StateObject var categoryViewModel : CategoryViewModel =
    CategoryViewModel(categoryService: CategoryService())
    
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    
    var body: some View {
        var categories : CategoryModel? = categoryViewModel.categories
        if categories != nil {
            /// if the album's data returns empty
            if categories!.data != nil {
                VStack {
                    Title3BoldPinkText(title: LocaleKeys.categories.locale())
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns,spacing: 20) {
                            ForEach(categories!.data!, id: \.id) {
                                category in
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170,height: 200)
                                        .foregroundColor(.gray40)
                                        .cornerRadius(CornerRadius.large)
                                    VStack {
                                        KFImage(URL(string: category.picture ?? ""))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 170, alignment: .center)
                                            .clipped()
                                            .cornerRadius(radius: CornerRadius.large, corners: [.topLeft,.topRight])
                                        Text(category.name ?? "")
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }.padding(.bottom,100)
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
