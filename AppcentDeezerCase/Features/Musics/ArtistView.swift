//
//  ArtistView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct ArtistView: View {
    @StateObject var artistViewModel : ArtistViewModel
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    
    var body: some View {
        let artists : ArtistModel? = artistViewModel.artists
        if artists != nil {
            /// if the artists data returns empty
            if artists!.data != nil {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns,spacing: SpacingConstants.gridSpacing) {
                            ForEach(artists!.data!, id: \.id) {
                                artist in
                                NavigationLink(destination: FavoriteListView()) {
                                    RectangleImageView(imageUrl: artist.picture ?? "",
                                                       title: artist.name ?? "")
                                }
                            }
                        }
                    }.padding(.bottom,
                              PaddingConstants.Bottom.high.rawValue)
                    .navigationTitle("") // hide back button's text
                        // for app bar title exp: (Artists)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Title3BoldPinkText(title: LocaleKeys.artists.locale())
                            }
                            
                        }
                        // text style for cards
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .accentColor(.pink) // for back button color
            }
        } else {
           CircleProgressView()
        }
    }
}

struct ArtistView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistView(artistViewModel: ArtistViewModel(genreId: "116"))
    }
}
