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
        let request = AF.request(StringConstants.baseUrl+"genre").serializingDecodable(CategoryModel.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}
