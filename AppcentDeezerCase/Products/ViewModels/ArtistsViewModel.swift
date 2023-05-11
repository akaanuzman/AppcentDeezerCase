//
//  ArtistViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation

class ArtistsViewModel: ObservableObject {
    let artistService : ArtistService = ArtistService()
    let genreId : String
    
    @Published var artists: ArtistsModel?
    
    init(genreId: String ,artists: ArtistsModel? = nil) {
        self.genreId = genreId
        self.artists = artists
        Task.detached {
            await self.fetchWholeArtists(genreId: self.genreId)
        }
    }
    
    func fetchWholeArtists(genreId: String) async {
        artists = await artistService.fetchArtists(genreId: genreId)
    }
}
