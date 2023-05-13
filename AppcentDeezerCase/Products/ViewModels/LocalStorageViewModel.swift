//
//  LocalStorageViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 13.05.2023.
//

import Foundation
import SwiftUI

final class LocalStorageViewModel: ObservableObject {
    @Published var items = [Datum]()
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = [1,7]
    var filteredItems: [Datum] {
        if showingFavs {
            return items.filter { savedItems.contains($0.id ?? 0) }
        } else {
            return items
        }
    }
    
    private var localStorageService = LocalStorageService()
    
    init(){
        //self.savedItems = localStorageService.read()
        //self.items = Datum.sam
    }
    
    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }
    
    func contains(_ item: Datum) -> Bool {
        savedItems.contains(item.id ?? 0)
    }
    
    func toogleFav(item: Datum) {
        if contains(item) {
            savedItems.remove(item.id ?? 0)
        } else {
            savedItems.insert(item.id ?? 0)
        }
        localStorageService.write(items: savedItems)
    }
}
