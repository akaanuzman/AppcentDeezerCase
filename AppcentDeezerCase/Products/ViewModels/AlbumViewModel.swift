//
//  ArtistInfoViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation

class ArtistInfoViewModel: ObservableObject {
    let artistService: ArtistService = .init()
    let albumService: AlbumService = .init()
    let artistId: String

    @Published var artist: ArtistModel?
    @Published var albums: AlbumModel?

    init(artistId: String, artist: ArtistModel? = nil) {
        self.artistId = artistId
        self.artist = artist
        Task.detached {
            await self.fetchArtist(artistId: self.artistId)
            await self.fetchWholeAlbums(artistId: self.artistId)
        }
    }

    func fetchArtist(artistId: String) async {
        artist = await artistService.fetchArtist(artistId: artistId)
    }

    func fetchWholeAlbums(artistId: String) async {
        albums = await albumService.fetchArtistAlbums(artistId: artistId)
    }
}
