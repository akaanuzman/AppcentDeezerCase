//
//  AlbumService.swift
//  AppcentDeezerCase
//
//  Created by Kaan Uzman on 8.05.2023.
//

import Foundation
import Alamofire

protocol ICategoryService {
    func fetchCategories() async -> CategoryModel?
}

class CategoryService: ICategoryService {
    func fetchCategories() async -> CategoryModel? {
        let url : String = StringConstants.baseUrl+"genre"
        let request = AF.request(url).serializingDecodable(CategoryModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
