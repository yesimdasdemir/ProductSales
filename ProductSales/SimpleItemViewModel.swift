//
//  SimpleItemViewModel.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import Foundation

struct SimpleItemViewModel {
    let id: Int?
    let title: String?
    let subTitleArray: [String]?
    let imageWidth: String
    var imageLink: String?
    
    init(id: Int? = nil, title: String? = nil, subTitleArray: [String]? = nil, imageWidth: String = "200", imageLink: String? = nil) {
        self.id = id
        self.title = title
        self.subTitleArray = subTitleArray
        self.imageWidth = imageWidth
        self.imageLink = imageLink
    }
}
