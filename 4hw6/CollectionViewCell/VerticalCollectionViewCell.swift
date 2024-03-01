//
//  SimpleCollectionViewCell.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 01/03/24.
//

import UIKit

class VerticalCollectionViewCell: UICollectionViewCell {
    
    private let logoImage = MakerView().makerImage(addSub: true,addBottomSub: true)
    private let saveButton = MakerView().makerButton(image: UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate), cornerRadius: 9)
    private let nameLabel = MakerView().makerLabel(font: .systemFont(ofSize: 15, weight: .semibold), textColor: .white)
    private let iconImage = MakerView().makerImage(cornerRadius: 8, addSub: false)
    private let personLabel = MakerView().makerLabel(font: .systemFont(ofSize: 12, weight: .light), textColor: .white)
    
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
        
        saveButton.tintColor = UIColor.white
        contentView.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: logoImage.trailingAnchor,constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 22),
            saveButton.widthAnchor.constraint(equalToConstant: 22)
        ])
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: -30),
            nameLabel.leadingAnchor.constraint(equalTo: logoImage.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
            iconImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(personLabel)
        NSLayoutConstraint.activate([
            personLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            personLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 5),
            personLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
        
    }
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        saveButton.isSelected.toggle()
    }
    
    func setData(items: Item){
        logoImage.image = items.logo
        nameLabel.text = items.name
        iconImage.image = items.icon
        personLabel.text = items.person
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
