//
//  SingleItemViewModel.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import Foundation

struct SingleItemViewModel {
    let id: Int?
    let title: String?
    let subTitle: String?
    let imageWidth: String
    var imageLink: String?
    
    init(id: Int? = nil, title: String? = nil, subTitle: String? = nil, imageWidth: String = "200", imageLink: String? = nil) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.imageWidth = imageWidth
        self.imageLink = imageLink
    }
}
