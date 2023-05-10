//
//  ArtistInfoModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 10.05.2023.
//

import Foundation

// MARK: - AlbumModel
struct AlbumModel: Codable {
    let data: [ArtistAlbum]?
    let total: Int?
    let next: String?
}

// MARK: - ArtistAlbum
struct ArtistAlbum : Codable {
    let id: Int?
    let readable: Bool?
    let title, titleShort: String?
    let titleVersion: TitleVersion?
    let link: String?
    let duration, rank: Int?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
    let contributors: [Contributor]?
    let md5Image: String?
    let artist: Artist?
    let album: Album?
    let type: DatumType?

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort
        case titleVersion
        case link, duration, rank
        case explicitLyrics
        case explicitContentLyrics
        case explicitContentCover
        case preview, contributors
        case md5Image
        case artist, album, type
    }
}

// MARK: - Album
struct Album: Codable {
    let id: Int?
    let title: String?
    let cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let tracklist: String?
    let type: AlbumType?

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall
        case coverMedium
        case coverBig
        case coverXl
        case md5Image
        case tracklist, type
    }
}

enum AlbumType: String, Codable {
    case album = "album"
}

// MARK: - Artist
struct Artist: Codable {
    let id: Int?
    let name: String?
    let tracklist: String?
    let type: ArtistType?
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

// MARK: - Contributor
struct Contributor: Codable {
    let id: Int?
    let name: String?
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type: ArtistType?
    let role: Role?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case radio, tracklist, type, role
    }
}

enum Role: String, Codable {
    case featured = "Featured"
    case main = "Main"
}

enum TitleVersion: String, Codable {
    case empty = ""
    case videoRemix = "(Video Remix)"
}

enum DatumType: String, Codable {
    case track = "track"
}
