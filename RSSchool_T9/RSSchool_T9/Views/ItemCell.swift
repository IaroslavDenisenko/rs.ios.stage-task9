//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let contentTypeLabel = UILabel()
    private let imageView = UIImageView()
    private var gradient: CAGradientLayer?
    private var size: CGFloat {
        bounds.size.height
    }
    private var titleLabelBottom: NSLayoutConstraint!
    private var contentTypeLabelBottom: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateDimensions()
    }
    
    func configureCell(title: String, contentType: String, image: UIImage) {
        titleLabel.text = title
        contentTypeLabel.text = contentType
        imageView.image = image
    }
}

fileprivate extension ItemCell {
    
    // MARK: Setup cell views
    
    private func setupCellViews() {
        setupMainView()
        setupImageView()
        setupGradient()
        addShadow()
        setupTitleLabel()
        setupContentTypeLabel()
    }
    
    private func setupMainView() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.91),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.91),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabelBottom = titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size/5.5)
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.77),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.09),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabelBottom
        ])
    }
    
    private func setupContentTypeLabel() {
        contentTypeLabel.font = UIFont(name: "Rockwell-Regular", size: 12)
        contentTypeLabel.textColor = UIColor(
            red: 0.712, green: 0.712, blue: 0.712, alpha: 1
        )
        contentTypeLabel.textAlignment = .left
        contentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentTypeLabel)
        
        contentTypeLabelBottom = contentTypeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -size / 9.57)
        
        NSLayoutConstraint.activate([
            contentTypeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.77),
            contentTypeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.09),
            contentTypeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentTypeLabelBottom
        ])
    }
    
    private func setupGradient() {
        let locations = [NSNumber(0.64), NSNumber(0.95)]
        let colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradient = imageView.addGradient(
            colors: colors,
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1),
            opacity: 1.0,
            location: locations
        )
    }
    
    private func updateDimensions() {
        gradient?.frame = bounds
        imageView.layer.cornerRadius = size / 22
        contentView.layer.cornerRadius = size / 12.22
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: size / 13.75)
        titleLabelBottom.constant = -size / 5.5
        contentTypeLabelBottom.constant = -size / 9.57
        contentTypeLabel.font = UIFont(name: "Rockwell-Regular", size: size / 18.33)
    }
    
    private func addShadow() {
        let shadowPath0 = UIBezierPath(rect: imageView.bounds)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.frame = imageView.bounds
        layer0.position = imageView.center
        imageView.layer.addSublayer(layer0)
    }
}
