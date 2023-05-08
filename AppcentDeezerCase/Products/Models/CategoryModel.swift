//
//  AlbumModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import Foundation

// MARK: - CategoryModel
struct CategoryModel: Codable {
    let data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case type
    }
}

