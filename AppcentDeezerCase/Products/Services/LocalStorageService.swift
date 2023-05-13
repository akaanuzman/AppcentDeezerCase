//
//  LocalStorageService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation

final class LocalStorageService {
    private let FAV_KEY = "fav_key"
    
    func write(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func read() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
}
