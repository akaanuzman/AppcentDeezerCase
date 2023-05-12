//
//  SongViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import AVFoundation
import Foundation

class SongViewModel: ObservableObject {
    let songService: SongService = .init()
    let albumId: String
    
    @Published var songs: SongModel?
    @Published var player: AVPlayer?
    @Published var isStart: Bool = true
    
    init(albumId: String, songs: SongModel? = nil) {
        self.albumId = albumId
        self.songs = songs
        Task.detached {
            await self.fetchWholeSongs(albumId: self.albumId)
        }
    }
    
    func fetchWholeSongs(albumId: String) async {
        songs = await songService.fetchSongs(albumId: albumId)
    }
    
    func playMusic(song: String) {
        guard let url = URL(string: song) else {
            print("Resource not found: \(song)")
            return
        }
        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        if isStart {
            player?.play()
        } else {
            player?.pause()
        }
        isStart.toggle()
    }
}
