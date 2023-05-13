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
    
    @Published var songs: Tracks?
    @Published var player: AVPlayer?
    @Published var isStart: Bool = true
    @Published var favoriteSongs: [FavoriteSongModel] = []

    
    init(albumId: String, songs: Tracks? = nil) {
        self.albumId = albumId
        self.songs = songs
        Task.detached {
            await self.fetchWholeSongs(albumId: self.albumId)
        }
    }
    
    func fetchWholeSongs(albumId: String) async {
        songs = await songService.fetchSongs(albumId: albumId)?.tracks
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
    
    func toggleFavorite(song: Datum) {
        if let index = favoriteSongs.firstIndex(where: { $0.song.id == song.id }) {
            favoriteSongs.remove(at: index)
            songs?.data?[songs?.data?.firstIndex(where: { $0.id == song.id })! ?? 0].isFav = false
        } else {
            favoriteSongs.append(FavoriteSongModel(id: UUID().uuidString, song: song))
            songs?.data?[songs?.data?.firstIndex(where: { $0.id == song.id })! ?? 0].isFav = true
        }
    }
}
