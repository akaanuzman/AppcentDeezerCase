//
//  ArtistModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//


import Foundation

// MARK: - ArtistModel
struct ArtistModel: Codable {
    let data: [Artist]?
}

// MARK: - Datum
struct Artist: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case radio, tracklist, type
    }
}

enum TypeEnum: String, Codable {
    case artist = "artist"
}

