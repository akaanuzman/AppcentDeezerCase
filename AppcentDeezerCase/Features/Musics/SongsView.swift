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
    @StateObject var audioViewModel: AudioViewModel = .init()
    @State var formattedTimerValue: String = "00:00"

    let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    
    func startTimer() {
        guard let player = audioViewModel.player else { return }
        let time = player.currentTime()
        formattedTimerValue = String(time.positionalTime)
    }

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
                                Image(systemName: songViewModel.getFavIcon(song: song))
                                    .padding(.horizontal).onTapGesture {
                                        songViewModel.toggleFavorite(song: song)
                                    }
                            }
                        }.onTapGesture {
                            audioViewModel.playMusic(song: song.preview ?? "")
                        }.onReceive(timer) {
                            _ in
                            startTimer()
                        }
                        .modifier(SongItemStyle())
                    })
                }
                .modifier(ToolbarAndBottomPadding(title: songsData.first?.album?.title ?? ""))
                .onAppear{
                    songViewModel.loadFavSongsFromStorage()
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
