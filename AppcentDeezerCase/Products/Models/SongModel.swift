import Foundation

// MARK: - SongModel
struct SongModel: Codable {
    var tracks: Tracks?
}

// MARK: - Tracks
struct Tracks: Codable {
    var data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    var id: Int?
    var readable: Bool?
    var title, titleShort, titleVersion: String?
    var link: String?
    var duration, rank: Int?
    var explicitLyrics: Bool?
    var explicitContentLyrics, explicitContentCover: Int?
    var preview: String?
    var md5Image: String?
    var artist: Artist?
    var album: Album?
    var type: String?
    var isFav: Bool = false
    var timerValue: String = "00:00"

    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview
        case md5Image = "md5_image"
        case artist, album, type
    }
}

// MARK: - Album
struct Album: Codable {
    var id: Int?
    var title: String?
    var cover: String?
    var coverSmall, coverMedium, coverBig, coverXl: String?
    var md5Image: String?
    var tracklist: String?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case tracklist, type
    }
}

// MARK: - Artist
struct Artist: Codable {
    var id: Int?
    var name: String?
    var tracklist: String?
    var type: String?
}
