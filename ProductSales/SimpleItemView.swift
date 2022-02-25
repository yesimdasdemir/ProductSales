//
//  SimpleItemView.swift
//  ProductSales
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import UIKit

final class SimpleItemView: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Variables
    
    private let cornerRadiusValue: CGFloat = 10.0
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Initialize methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    var viewModel: SimpleItemViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    private func initView(viewModel: SimpleItemViewModel) {
        if let imageLink = viewModel.imageLink {
            imageView.loadImage(urlString: imageLink)
        } else {
            imageView.image = nil
        }
        
        imageView.layer.cornerRadius = cornerRadiusValue
        imageView.clipsToBounds = true
        
        titleLabel.text = viewModel.title
        
        viewModel.subTitleArray?.forEach({ item in
            subTitleLabel.text = item
            stackView.addArrangedSubview(subTitleLabel)
        })
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
