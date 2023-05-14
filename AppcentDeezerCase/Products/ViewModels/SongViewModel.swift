//
//  SongViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import Foundation

class SongViewModel: ObservableObject {
    let songService: SongService = .init()
    let albumId: String
    let favListStorageService: FavListStorageService = .init()

    @Published var songs: Tracks?
    @Published var favoriteSongs: [FavoriteSongModel] = []

    init(albumId: String, songs: Tracks? = nil) {
        self.albumId = albumId
        self.songs = songs
        loadFavSongsFromStorage()
        Task.detached {
            await self.fetchWholeSongs(albumId: self.albumId)
        }
    }

    func loadFavSongsFromStorage() {
        favoriteSongs = favListStorageService.getStorage()
    }

    func fetchWholeSongs(albumId: String) async {
        songs = await songService.fetchSongs(albumId: albumId)?.tracks
    }

    func toggleFavorite(song: Datum) {
        if let index = favoriteSongs.firstIndex(where: { $0.song.id == song.id }) {
            favoriteSongs.remove(at: index)
            print("remove")
            favListStorageService.addStorage(songs: favoriteSongs)
            songs?.data?[songs?.data?.firstIndex(where: { $0.id == song.id })! ?? 0].isFav = false
        } else {
            if let index = songs?.data?.firstIndex(where: { $0.id == song.id }) {
                songs?.data?[index].isFav = true
                let newSong = songs?.data?[index] ?? Datum()
                let newFavSong = FavoriteSongModel(id: UUID().uuidString, song: newSong)
                favoriteSongs.append(newFavSong)
                print("add")
                favListStorageService.addStorage(songs: favoriteSongs)
            }
        }
    }

    func getFavIcon(song: Datum) -> String {
        if favoriteSongs.firstIndex(where: { $0.song.id == song.id }) != nil {
            print("*")
            return ImageConstants.heartFill.rawValue
        } else {
            print("-")
            return ImageConstants.heart.rawValue
        }
    }
}
