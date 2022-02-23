//
//  SingleItemView.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import UIKit

final class SingleItemView: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    private let cornerRadiusValue: CGFloat = 10.0
    
    // MARK: Initialize methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    var viewModel: SingleItemViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    private func initView(viewModel: SingleItemViewModel) {
        if let imageLink = viewModel.imageLink, let url = URL(string: imageLink) {
            imageView.setImage(url: url)
        }
        
        imageView.layer.cornerRadius = cornerRadiusValue
        imageView.clipsToBounds = true
        
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
    }
    
    // MARK: LoadNib
    
    private func loadNib() {
        let nibName = String(describing: type(of: self))
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
}
