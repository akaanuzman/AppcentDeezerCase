//
//  ArtistService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Alamofire
import Foundation

class ArtistService {
    /// Fetch all artists from by genreId
    func fetchArtists(genreId: String) async -> ArtistsModel? {
        let url: String = StringConstants.baseUrl+"genre/\(genreId)/artists"
        let request = AF.request(url).serializingDecodable(ArtistsModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }

    /// Fetch only one artist from by artistId
    func fetchArtist(artistId: String) async -> ArtistModel? {
        let url: String = StringConstants.baseUrl+"artist/\(artistId)"
        let request = AF.request(url).serializingDecodable(ArtistModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
