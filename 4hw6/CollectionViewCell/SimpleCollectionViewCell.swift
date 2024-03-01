//
//  SimpleCollectionViewCell.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 01/03/24.
//

import UIKit

class SimpleCollectionViewCell: UICollectionViewCell {
    
    private let logoImage = MakerView().makerImage()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureImageView()
    }
    
    private func configureImageView(){
        
        contentView.backgroundColor = .black
        
        contentView.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
