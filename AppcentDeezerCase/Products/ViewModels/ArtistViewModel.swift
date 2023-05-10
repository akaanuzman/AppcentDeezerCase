//
//  ArtistViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation

class ArtistViewModel: ObservableObject {
    let artistService : ArtistService = ArtistService()
    let genreId : String
    
    @Published var artists: ArtistModel?
    
    init(genreId: String ,artists: ArtistModel? = nil) {
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
