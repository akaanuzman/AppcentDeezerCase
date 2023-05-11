//
//  SongViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import Foundation


class SongViewModel: ObservableObject {
    let songService : SongService = SongService()
    let albumId : String
    
    @Published var songs: SongModel?
    
    init(albumId: String ,songs: SongModel? = nil) {
        self.albumId = albumId
        self.songs = songs
        Task.detached {
            await self.fetchWholeSongs(albumId: self.albumId)
        }
    }
    
    func fetchWholeSongs(albumId: String) async {
        songs = await songService.fetchSongs(albumId: albumId)
    }
}
