//
//  ProductDetailMock.swift
//  ProductSalesTests
//
//  Created by Yeşim Daşdemir on 24.02.2022.
//

@testable import ProductSales

final class ProductDetailMock {
    static let productDetailResponse = ProductSales.GetProductList.Response(products: [ProductItem(productId: nil,
                                                                                                   productName: "Apple",
                                                                                                   productImage: "iPhone 12",
                                                                                                   reviewInformation: nil,
                                                                                                   availabilityState: nil,
                                                                                                   nextDayDelivery: false)],
                                                                            currentPage: 0,
                                                                            pageSize: 0,
                                                                            totalResults: 0,
                                                                            pageCount: 0)
}


