//
//  ArtistModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation

// MARK: - ArtistModel

struct ArtistModel: Codable {
    let id: Int?
    let name: String?
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let nbAlbum, nbFan: Int?
    let radio: Bool?
    let tracklist: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case nbAlbum
        case nbFan
        case radio, tracklist, type
    }
}
