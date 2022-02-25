//
//  CustomCollectionViewCell.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var simpleItemView: SimpleItemView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with model: SimpleItemViewModel?) {
        simpleItemView?.viewModel = model
    }
}
