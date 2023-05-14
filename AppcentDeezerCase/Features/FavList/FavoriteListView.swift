//
//  FavoriteListView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject private var favListViewModel: FavListViewModel = .init()
    @StateObject private var audioViewModel: AudioViewModel = .init()
    @State var formattedTimerValue: String = "00:00"

    let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()

    func startTimer() {
        guard let player = audioViewModel.player else { return }
        let time = player.currentTime()
        formattedTimerValue = String(time.positionalTime)
    }

    var body: some View {
        if !favListViewModel.songs.isEmpty {
            let songs = favListViewModel.songs
            NavigationView {
                ScrollView {
                    ForEach(songs, id: \.id, content: { song in
                        VStack {
                            HStack {
                                AlbumImageView(imageUrl: song.song.album?.cover ?? "")
                                VStack(alignment: .leading) {
                                    Text(song.song.title ?? "null")
                                        .lineLimit(1)
                                    Text(formattedTimerValue)
                                }.padding(.horizontal)
                                Spacer()
                                Image(systemName: !song.song.isFav ? ImageConstants.heartFill.rawValue : ImageConstants.heart.rawValue)
                                    .padding(.horizontal).onTapGesture {
                                        favListViewModel.toogleFavorite(song: song.song)
                                    }
                            }
                        }.onTapGesture {
                            audioViewModel.playMusic(song: song.song.preview ?? "")
                        }
                        .onReceive(timer) {
                            _ in
                            startTimer()
                        }
                        .modifier(SongItemStyle())
                    })
                }.modifier(FavListModif())
                    .onAppear {
                        favListViewModel.loadSongsFromStorage()
                    }

            }.modifier(FontStyle())

        } else {
            
            NavigationView {
                Text(LocaleKeys.haveNotFavList.rawValue.locale())
                    .padding()
                    .multilineTextAlignment(.center)
                    .modifier(FavListModif())
                    .onAppear {
                        favListViewModel.loadSongsFromStorage()
                    }
            }
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
    }
}
