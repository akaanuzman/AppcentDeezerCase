//
//  SongsView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import AVFoundation
import SwiftUI

struct SongsView: View {
    @StateObject var songViewModel: SongViewModel
    @State var formattedTimerValue: String = "00:00"

    let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        let tracks: Tracks? = songViewModel.songs
        if let songs = tracks {
            if let songsData = songs.data {
                ScrollView {
                    ForEach(songsData, id: \.id, content: { song in
                        VStack {
                            HStack {
                                AlbumImageView(imageUrl: song.album?.cover ?? "")
                                VStack(alignment: .leading) {
                                    Text(song.title ?? "null")
                                        .lineLimit(1)
                                    Text(formattedTimerValue)
                                }.padding(.horizontal)
                                Spacer()
                                Image(systemName: song.isFav ? "heart.fill" : "heart")
                                    .padding(.horizontal).onTapGesture {
                                        songViewModel.toggleFavorite(song: song)
                                    }
                            }
                        }.onTapGesture {
                            songViewModel.playMusic(song: song.preview ?? "")

                        }.onReceive(timer) {
                            _ in
                            guard let player = songViewModel.player else { return }
                            let time = player.currentTime()
                            formattedTimerValue = String(time.positionalTime)
                        }
                        .modifier(SongItemStyle())
                    })
                }
                .modifier(ToolbarAndBottomPadding(title: songsData.first?.album?.title ?? ""))
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
