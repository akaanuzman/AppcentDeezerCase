//
//  ArtistInfoViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation


class ArtistInfoViewModel: ObservableObject {
    let artistService : ArtistService = ArtistService()
    let artistId : String
    let tracklist : String
    
    @Published var artist: ArtistModel?
    @Published var albums : AlbumModel?
    
    init(artistId: String ,tracklist: String ,artist: ArtistModel? = nil) {
        self.artistId = artistId
        self.tracklist = tracklist
        self.artist = artist
        Task.detached {
            await self.fetchArtist(artistId: self.artistId)
            await self.fetchWholeAlbums(tracklist: tracklist)
        }
    }
    
    func fetchArtist(artistId: String) async {
        artist = await artistService.fetchArtist(artistId: artistId)
    }
    
    func fetchWholeAlbums(tracklist: String) async {
        albums = await artistService.fetchArtistAlbums(tracklist: tracklist)
    }
}
