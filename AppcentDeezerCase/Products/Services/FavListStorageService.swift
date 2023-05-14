//
//  FavListStorageService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 14.05.2023.
//

import Foundation


class FavListStorageService {
    private let key: String = "oh35854alM"
    
    /// Save favorite song to local storage
    func addStorage(songs: [FavoriteSongModel]) {
        let encodedData = encodeData(songs)
        UserDefaults.standard.set(encodedData, forKey: key)
    }
    
    /// Encode FavoriteSongModel array item
    private func encodeData(_ songs: [FavoriteSongModel]) -> [Data] {
        let jsonEncoder = JSONEncoder()
        var encodedData: [Data] = []
        for song in songs {
            do {
                let jsonData = try jsonEncoder.encode(song)
                encodedData.append(jsonData)
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                print(json ?? "")
            } catch {
                print(error)
            }
        }
        print(encodedData.count)
        return encodedData
    }
    
    /// Fetch favorite songs
    func getStorage() -> [FavoriteSongModel] {
        let encodedData = UserDefaults.standard.array(forKey: key) as? [Data] ?? [Data]()
        let songs = decodedData(encodedData)
        return songs
    }
    
    /// Decode to encode data from local storage
    func decodedData(_ encodedData: [Data]) -> [FavoriteSongModel] {
        let jsonDecoder = JSONDecoder()
        var songs: [FavoriteSongModel] = []
        for encode in encodedData {
            do {
                let decodeData = try jsonDecoder.decode(FavoriteSongModel.self, from: encode)
                songs.append(decodeData)
                print(decodeData)
            } catch {
                print(error)
            }
        }
        print(songs.count)
        return songs
    }
}
