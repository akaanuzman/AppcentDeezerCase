//
//  FavListViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 14.05.2023.
//

import Foundation

class FavListViewModel: ObservableObject {
    private var favListStorageService = FavListStorageService()
    @Published var songs = [FavoriteSongModel]()

    func loadSongsFromStorage() {
        songs = favListStorageService.getStorage()
    }
    
    func toogleFavorite(song: Datum) {
        if let index = songs.firstIndex(where: { $0.song.id == song.id }) {
            songs.remove(at: index)
            favListStorageService.addStorage(songs: songs)
        }
    }
}
