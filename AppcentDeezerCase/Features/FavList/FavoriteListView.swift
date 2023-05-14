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
                            guard let player = audioViewModel.player else { return }
                            let time = player.currentTime()
                            formattedTimerValue = String(time.positionalTime)
                        }
                        .modifier(SongItemStyle())
                    })
                }.modifier(ToolbarAndBottomPadding(title: "Beğeni Listesi"))
                    .navigationTitle("")
            }.modifier(FontStyle())
                .onAppear {
                    favListViewModel.loadSongsFromStorage()
                }

        } else {
            NavigationView {
                Text("Henüz favoriye eklediğiniz bir şarkı bulunmamaktadır.")
                    .padding()
                    .multilineTextAlignment(.center)
                    .modifier(ToolbarAndBottomPadding(title: "Beğeni Listesi"))
                        .navigationTitle("")
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
