//
//  AlbumView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import SwiftUI
import Kingfisher

struct AlbumView: View {
    @StateObject var artistInfoViewModel : ArtistInfoViewModel
    
    var body: some View {
        let artist : ArtistModel? = artistInfoViewModel.artist
        let albums : AlbumModel? = artistInfoViewModel.albums
        if artist != nil && albums != nil {
            VStack {
                ArtistImageView(imageUrl: artist!.picture ?? "")
                if albums!.data != nil {
                    List(albums!.data!, id: \.id) {
                        album in
                            Section {
                                NavigationLink(destination:
                                        SongsView(songViewModel:
                                            SongViewModel(albumId: String(album.id ?? 0))))  {
                                    HStack {
                                        AlbumImageView(imageUrl: album.cover ?? "")
                                        VStack(alignment: .leading) {
                                            Text(album.title ?? "null")
                                            Text(album.release_date ?? "null")
                                        }.padding(.horizontal)
                                        Spacer()
                                    }
                                }
                            }.listRowBackground(Color.pink) // list item bg color
                            .listRowInsets(EdgeInsets())// remove list padding
                    }.scrollContentBackground(.hidden) // list bg color hidden
                        .listStyle(.insetGrouped)
                }
            }.frame(maxWidth: .infinity)
            .padding(.bottom,
                      PaddingConstants.Bottom.high.rawValue)
            .navigationTitle("")  // hide back button's text
            // for app bar title exp: (Artists)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Title3BoldPinkText(title: artist!.name?.locale() ?? "")
                }
            }
        } else {
            CircleProgressView()
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(artistInfoViewModel:
                    ArtistInfoViewModel(artistId: "8354140"))
    }
}
