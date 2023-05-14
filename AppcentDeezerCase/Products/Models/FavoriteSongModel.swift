//
//  FavoriteSongModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation

struct FavoriteSongModel: Identifiable, Codable {
    let id: String
    var song: Datum
}
