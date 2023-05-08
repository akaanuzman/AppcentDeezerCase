//
//  AlbumViewModel.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import Foundation

class CategoryViewModel: ObservableObject {
    let categoryService : CategoryService
    
    @Published var categories: CategoryModel?
    
    init(categoryService: CategoryService, categories: CategoryModel? = nil) {
        self.categoryService = categoryService
        self.categories = categories
        Task.detached {
            await self.fetchWholeCategories()
        }
    }
    
    func fetchWholeCategories() async {
        categories = await categoryService.fetchCategories()
    }
}
