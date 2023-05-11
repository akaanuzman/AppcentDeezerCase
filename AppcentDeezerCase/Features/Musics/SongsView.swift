//
//  SongsView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import SwiftUI
import AVFoundation

struct SongsView: View {
    @State var songViewModel : SongViewModel
    
    var body: some View {
        let songs : SongModel? = songViewModel.songs
        if songs != nil {
            if songs!.tracks != nil && songs!.tracks!.data != nil {
                List(songs!.tracks!.data!,id: \.id) {
                    song in
                    Section {
                        HStack {
                            AlbumImageView(imageUrl: song.album?.cover ?? "")
                            VStack(alignment: .leading) {
                                Text(song.title ?? "null")
                                Text("0:00")
                            }.padding(.horizontal)
                            Spacer()
                            Image(systemName: "heart")
                                .padding(.horizontal)
                        }
                    }.onTapGesture {
                        songViewModel.playMusic(song: song.preview ?? "")
                    }.listRowBackground(Color.pink) // list item bg color
                        .listRowInsets(EdgeInsets()) // remove list padding
                }.scrollContentBackground(.hidden) // list bg color hidden
                    .listStyle(.insetGrouped)
                    .padding(.bottom,
                          PaddingConstants.Bottom.high.rawValue)
                    // for app bar title exp: (Artists)
                    .toolbar {
                    ToolbarItem(placement: .principal) {
                        Title3BoldPinkText(title: songs!.title?.locale() ?? "")
                    }
                }
            }
        } else {
            CircleProgressView()
        }
    }
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView(songViewModel:
                    SongViewModel(albumId: "168136152"))
    }
}
