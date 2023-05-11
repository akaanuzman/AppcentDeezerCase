//
//  AlbumService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import Foundation
import Alamofire

class AlbumService {
    
    /// Fetch only one artist information (albums,songs) from by artist id
    func fetchArtistAlbums(artistId: String) async -> AlbumModel? {
        let url : String = StringConstants.baseUrl+"artist/\(artistId)/albums"
        let request = AF.request(url).serializingDecodable(AlbumModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
