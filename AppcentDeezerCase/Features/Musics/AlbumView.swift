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
    
    // MARK: remove ArtistAlbum with duplicate album id
    func filterAlbum(albums: [ArtistAlbum]) -> [ArtistAlbum] {
        print(Array(Set(albums)).count)
        return Array(Set(albums))
    }

    var body: some View {
        let artist : ArtistModel? = artistInfoViewModel.artist
        let albums : AlbumModel? = artistInfoViewModel.albums
        if artist != nil && albums != nil {
            VStack {
                KFImage(URL(string: artist!.picture ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: HeightSize.imgHeight)
                if albums!.data != nil {
                    let filteredAlbum = filterAlbum(albums: albums!.data!)
                    List(filteredAlbum, id: \.id) {
                        album in
                        Section {
                            HStack {
                                KFImage(URL(string: album.album?.cover ?? ""))
                                    .resizable().aspectRatio(contentMode: .fill)
                                    .scaledToFill()
                                    .frame(width: 60,height: 60).clipped()
                                Text(album.album?.title ?? "")
                                Spacer()
                            }
                        }.listRowBackground(Color.pink)
                            .listRowInsets(EdgeInsets())
                            
                    }.scrollContentBackground(.hidden)
                        .listStyle(.insetGrouped)
                }
                
            }.frame(maxWidth: .infinity)
            .padding(.bottom,
                      PaddingConstants.Bottom.high.rawValue)
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
                        ArtistInfoViewModel(artistId: "8354140",
                                            tracklist: "https://api.deezer.com/artist/8354140/top?limit=50"))
    }
}
