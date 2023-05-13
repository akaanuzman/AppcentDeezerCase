//
//  ArtistView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct ArtistsView: View {
    @StateObject var artistsViewModel: ArtistsViewModel
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 140))]
    let categoryName: String

    var body: some View {
        let artistsModel: ArtistsModel? = artistsViewModel.artists
        if let artists = artistsModel {
            /// if the artists data returns empty
            if let artistData = artists.data {
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns) {
                        ForEach(artistData, id: \.id) {
                            artist in
                            NavigationLink(destination:
                                AlbumView(artistInfoViewModel: ArtistInfoViewModel(artistId: String(artist.id ?? 0))))
                            {
                                ImageCardView(imageUrl: artist.picture ?? "",
                                              title: artist.name ?? "")
                            }
                        }
                    }
                }.modifier(ToolbarAndBottomPadding(title: categoryName))
                    .navigationTitle("") // hide back button's text
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
