//
//  SongService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 11.05.2023.
//

import Foundation
import Alamofire

class SongService {
    
    /// Fetch songs from by album id
    func fetchSongs(albumId: String) async -> SongModel? {
        let url : String = StringConstants.baseUrl+"album/\(albumId)"
        print(url)
        let request = AF.request(url).serializingDecodable(SongModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
