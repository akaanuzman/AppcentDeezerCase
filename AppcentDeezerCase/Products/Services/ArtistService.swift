//
//  ArtistService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation
import Alamofire

protocol IArtistService {
    func fetchArtists(genreId: String) async -> ArtistModel?
}


class ArtistService: IArtistService {
    
    func fetchArtists(genreId: String) async -> ArtistModel? {
        let url : String = StringConstants.baseUrl+"genre/\(genreId)/artists"
        let request = AF.request(url).serializingDecodable(ArtistModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
