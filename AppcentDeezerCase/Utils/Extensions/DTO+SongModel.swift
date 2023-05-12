//
//  DTO+SongModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 12.05.2023.
//

import Foundation

extension SongModel {
    struct DTO: Decodable {
        var songTime : String = "00:00"
        var isFav : Bool = false
    }
    
    init(from dto: DTO) {
        songTime = dto.songTime
        
    }
}
