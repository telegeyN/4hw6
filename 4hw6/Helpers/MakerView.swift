//
//  MakerView.swift
//  4hw6
//
//  Created by Telegey Nurbekova on 29/02/24.
//

import UIKit

class MakerView {
    
    func makerImage(imageName: String = "",
                    cornerRadius: CGFloat = 15,
                    addSub: Bool = true,
                    addBottomSub: Bool = false,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        if addSub == true {
            
            let overlayView = UIView()
            overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            overlayView.translatesAutoresizingMaskIntoConstraints = false
            
            
            imageView.addSubview(overlayView)
            overlayView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            overlayView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
            overlayView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
            overlayView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            
        }
        
        if addBottomSub == true {
            
            let bottomOverlayView = UIView()
            bottomOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            bottomOverlayView.translatesAutoresizingMaskIntoConstraints = false
            
            imageView.addSubview(bottomOverlayView)
            bottomOverlayView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            bottomOverlayView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
            bottomOverlayView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            bottomOverlayView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.11).isActive = true
        }
        
        return imageView
    }
    
    
    func makerLabel(text: String = "",
                    font: UIFont = .systemFont(ofSize: 22, weight: .bold),
                    textColor: UIColor = .black,
                    backgroundColor: UIColor = .clear,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int = 0,
                    lineBreakMode:NSLineBreakMode = .byWordWrapping,
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makerButton(backgroundColor: UIColor = .init(hex: "#f5484a"),
                     image: UIImage? = nil,
                     image2: UIImage? = nil,
                     title: String = "",
                     titleColor: UIColor = .white,
                     titleFont: UIFont = Fonts.bold.size(16),
                     cornerRadius: CGFloat = 15,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .clear,
                     translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setImage(image, for: .normal)
        button.setImage(image2, for: .selected)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return button
    }
}
