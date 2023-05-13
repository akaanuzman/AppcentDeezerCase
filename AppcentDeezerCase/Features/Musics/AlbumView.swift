//
//  AlbumView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Kingfisher
import SwiftUI

struct AlbumView: View {
    @StateObject var artistInfoViewModel: ArtistInfoViewModel

    var body: some View {
        let artistModel: ArtistModel? = artistInfoViewModel.artist
        let albumModel: AlbumModel? = artistInfoViewModel.albums
        if let artist = artistModel, let albums = albumModel {
            VStack {
                ArtistImageView(imageUrl: artist.picture ?? "")
                if let albumData = albums.data {
                    List(albumData, id: \.id) {
                        album in
                        Section {
                            NavigationLink(destination:
                                SongsView(songViewModel:
                                    SongViewModel(albumId: String(album.id ?? 0))))
                            {
                                HStack {
                                    AlbumImageView(imageUrl: album.cover ?? "")
                                    VStack(alignment: .leading) {
                                        Text(album.title ?? "null")
                                        Text(album.release_date ?? "null")
                                    }.padding(.horizontal)
                                    Spacer()
                                }
                            }
                        }.modifier(AlbumItemStyle())
                    }.scrollContentBackground(.hidden) // list bg color hidden
                }
            }.frame(maxWidth: .infinity)
                .modifier(ToolbarAndBottomPadding(title: artist.name ?? ""))
                .navigationTitle("") // hide back button's text
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
