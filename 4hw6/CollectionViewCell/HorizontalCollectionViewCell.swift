//
//  HorizontalCollectionViewCell.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 01/03/24.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    private let logoImage = MakerView().makerImage(cornerRadius: 15, addSub: true,addBottomSub: true)
    private let nameLabel = MakerView().makerLabel(font: .systemFont(ofSize: 15, weight: .semibold), textColor: .white)
    private let quantityLabel = MakerView().makerLabel(font: .systemFont(ofSize: 12, weight: .light), textColor: .white)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureImageView()
    }
    
    private func configureImageView(){
        
        contentView.backgroundColor = .clear
        
        contentView.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: -30),
            nameLabel.leadingAnchor.constraint(equalTo: logoImage.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            quantityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
        
        
    }
    
    func setData(sections: Section){
        logoImage.image = sections.logo
        nameLabel.text = sections.name
        quantityLabel.text = sections.quantity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
