//
//  ArtistView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI

struct ArtistView: View {
    @StateObject var artistViewModel : ArtistViewModel
    
    
    var body: some View {
        let artists : ArtistModel? = artistViewModel.artists
        if artists != nil {
            /// if the artists data returns empty
            if artists!.data != nil {
                VStack {
                    Title3BoldPinkText(title: LocaleKeys.categories.locale())
                    GridView(artists: artists!)
                }.padding(.bottom,
                          PaddingConstants.Bottom.high.rawValue)
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

/// MARK: MAKE COMPONENT
private struct GridView: View {
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 200)) ]
    let artists : ArtistModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns,spacing: SpacingConstants.gridSpacing) {
                ForEach(artists.data!, id: \.id) {
                    artist in
                    RectangleImageView(imageUrl: artist.picture ?? "",
                                       title: artist.name ?? "")
                }
            }
        }
    }
}
