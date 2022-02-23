//
//  CustomCollectionViewCell.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var singleItemView: SingleItemView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with model: SingleItemViewModel?) {
        singleItemView?.viewModel = model
    }
}
