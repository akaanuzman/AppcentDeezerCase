import Foundation

// MARK: - AlbumModel

struct AlbumModel: Codable {
    let data: [AlbumData]?
    let total: Int?
    let next: String?
}

// MARK: - AlbumData

struct AlbumData: Codable {
    let id: Int?
    let title: String?
    let link, cover: String?
    let coverSmall, coverMedium, coverBig, coverXl: String?
    let md5Image: String?
    let genreID, fans: Int?
    let release_date: String?
    let recordType: RecordTypeEnum?
    let tracklist: String?
    let explicitLyrics: Bool?
    let type: RecordTypeEnum?

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall
        case coverMedium
        case coverBig
        case coverXl
        case md5Image
        case genreID
        case fans
        case release_date
        case recordType
        case tracklist
        case explicitLyrics
        case type
    }
}

enum RecordTypeEnum: String, Codable {
    case album
    case single
}
