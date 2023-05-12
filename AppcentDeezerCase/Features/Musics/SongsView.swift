//
//  SongsView.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import AVFoundation
import SwiftUI

struct SongsView: View {
    @State var songViewModel: SongViewModel
    @State var formattedTimerValue: String = "00:00"
    @State var isFav: Bool = false
    let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        let songModel: SongModel? = songViewModel.songs
        if let songs = songModel {
            if let tracks = songs.tracks, let songsData = tracks.data {
                /* List(songs!.tracks!.data!, id: \.id) {
                     song in
                     Section {
                         HStack {
                             AlbumImageView(imageUrl: song.album?.cover ?? "")
                             VStack(alignment: .leading) {
                                 Text(song.title ?? "null")
                                     .lineLimit(1)
                                 Text(formattedTimerValue)
                             }.padding(.horizontal)
                             Spacer()
                             Image(systemName: isFav ? "heart.fill" : "heart")
                                 .padding(.horizontal).onTapGesture {
                                     isFav.toggle()
                                 }
                         }
                     }.onTapGesture {
                         songViewModel.playMusic(song: song)
                     }.onReceive(timer) {
                         _ in
                         guard let player = songViewModel.player else { return }
                         let time = player.currentTime()
                         formattedTimerValue = String(time.positionalTime)
                         // formattedTimerValue = songViewModel.favMusic()
                         // print(songViewModel.selectedSong != nil && formattedTimerValue != "nil" ? formattedTimerValue : song.timeValue)
                     }
                     .listRowBackground(Color.pink) // list item bg color
                     .listRowInsets(EdgeInsets()) // remove list padding
                 } */

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
                                Image(systemName: isFav ? "heart.fill" : "heart")
                                    .padding(.horizontal).onTapGesture {
                                        isFav.toggle()
                                    }
                            }
                        }.onTapGesture {
                            songViewModel.playMusic(song: song.preview ?? "")
                        }.onReceive(timer) {
                            _ in
                            guard let player = songViewModel.player else { return }
                            let time = player.currentTime()
                            formattedTimerValue = String(time.positionalTime)
                            // formattedTimerValue = songViewModel.favMusic()
                            // print(songViewModel.selectedSong != nil && formattedTimerValue != "nil" ? formattedTimerValue : song.timeValue)
                        }
                        .background(.pink)
                        .cornerRadius(CornerRadius.low)
                        .padding()
                    })
                }
                .scrollContentBackground(.hidden) // list bg color hidden
                .listStyle(.insetGrouped)
                .padding(.bottom,
                         PaddingConstants.Bottom.high.rawValue)
                // for app bar title exp: (Artists)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Title3BoldPinkText(title: songs.tracks!.data!.first!.album?.title?.locale() ?? "")
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
