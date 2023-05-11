import Foundation

// MARK: - SongModel
struct SongModel: Codable {
    let id: Int?
    let title, upc: String?
    let link, share, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let genreID: Int?
    let genres: Genres?
    let label: String?
    let nbTracks, duration, fans: Int?
    let releaseDate, recordType: String?
    let available: Bool?
    let tracklist: String?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let contributors: [Contributor]?
    let artist: Artist?
    let type: String?
    let tracks: Tracks?

    enum CodingKeys: String, CodingKey {
        case id, title, upc, link, share, cover
        case coverSmall
        case coverMedium
        case coverBig
        case coverXl
        case md5Image
        case genreID
        case genres, label
        case nbTracks
        case duration, fans
        case releaseDate
        case recordType
        case available, tracklist
        case explicitLyrics
        case explicitContentLyrics
        case explicitContentCover
        case contributors, artist, type, tracks
    }
}

// MARK: - Artist
struct Artist: Codable {
    let id: Int?
    let name: Name?
    let picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let tracklist: String?
    let type: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case id, name, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case tracklist, type
    }
}

enum Name: String, Codable {
    case murda = "Murda"
    case rapHipHop = "Rap/Hip Hop"
}

enum TypeEnum: String, Codable {
    case artist = "artist"
    case genre = "genre"
}

// MARK: - Contributor
struct Contributor: Codable {
    let id: Int?
    let name: String?
    let link, share, picture: String?
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String?
    let radio: Bool?
    let tracklist: String?
    let type: TypeEnum?
    let role: String?

    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall
        case pictureMedium
        case pictureBig
        case pictureXl
        case radio, tracklist, type, role
    }
}

// MARK: - Genres
struct Genres: Codable {
    let data: [ArtistElement]?
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int?
    let name: Name?
    let picture: String?
    let type: TypeEnum?
    let tracklist: String?
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]?
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
    let id: Int?
    let readable: Bool?
    let title, titleShort, titleVersion: String?
    let link: String?
    let duration, rank: Int?
    let explicitLyrics: Bool?
    let explicitContentLyrics, explicitContentCover: Int?
    let preview: String?
    let md5Image: String?
    let artist: ArtistElement?
    let album: Album?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort
        case titleVersion
        case link, duration, rank
        case explicitLyrics
        case explicitContentLyrics
        case explicitContentCover
        case preview
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
    let type: String?

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
