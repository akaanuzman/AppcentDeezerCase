//
//  ArtistView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct ArtistsView: View {
    @StateObject var artistsViewModel : ArtistsViewModel
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 140)) ]
    let categoryName : String
    
    var body: some View {
        let artists : ArtistsModel? = artistsViewModel.artists
        if artists != nil {
            /// if the artists data returns empty
            if artists!.data != nil {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(artists!.data!, id: \.id) {
                                artist in
                                NavigationLink(destination:
                                                AlbumView(artistInfoViewModel: ArtistInfoViewModel(artistId: String(artist.id ?? 0)))) {
                                    ImageCardView(imageUrl: artist.picture ?? "",
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
                                Title3BoldPinkText(title: categoryName.locale())
                            }
                        }
            }
        } else {
           CircleProgressView()
        }
    }
}

struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(artistsViewModel: ArtistsViewModel(genreId: "116"),
                    categoryName: "Rap")
    }
}
