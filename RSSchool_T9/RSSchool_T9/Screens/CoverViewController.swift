//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 04.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CoverViewController: ScrollViewController {
    
    var coverView: UIView!
    var imageView: UIImageView!
    var gradient: CAGradientLayer?
    var coverImage: UIImage?
    var coverTitle: String?
    var contentType: String?
    var size: CGFloat {
        min(view.bounds.width, view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient?.frame = coverView.bounds
    }
}

private extension CoverViewController {
    
    private func setupViews() {
        setupCoverView()
        setupImageView()
        setupGradient()
        setupTitleLabel()
        setupContentTypeLabel()
        setupDividerView()
    }
    
    private func setupCoverView() {
        coverView = UIView()
        coverView.backgroundColor = .clear
        scrollView.addSubview(coverView)
        coverView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverView.widthAnchor.constraint(equalToConstant: size * 0.9),
            coverView.heightAnchor.constraint(equalToConstant: size * 1.24),
            coverView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coverView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100)
        ])
    }
    
    private func setupImageView() {
        imageView = UIImageView(image: coverImage)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = size / 51.75
        imageView.layer.masksToBounds = true
        
        coverView.addSubview(
            subview: imageView,
            leading: 0,
            top: 0,
            trailing: 0,
            bottom: size / 21.79
        )
    }
    
    private func setupTitleLabel() {
        let titleLabel = InsetLabel()
        titleLabel.contentInsets = UIEdgeInsets(
            top: 3.0, left: 0, bottom: 0, right: 0
        )
        titleLabel.font = UIFont(name: "Rockwell-Regular",
                                 size: size / 8.63)
        titleLabel.textColor = .white
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .left
        titleLabel.text = coverTitle
        titleLabel.numberOfLines = 2
        
        coverView.addSubview(
            subview: titleLabel,
            leading: size / 13.8,
            top: nil,
            trailing: size / 13.8,
            bottom: size / 5.67
        )
    }
    
    private func setupContentTypeLabel() {
        let contentTypeLabel = InsetLabel()
        contentTypeLabel.contentInsets = UIEdgeInsets(
            top: size / 51.75,
            left: 0,
            bottom: 0,
            right: 0
        )
        contentTypeLabel.font = UIFont(name: "Rockwell-Regular",
                                       size: size / 17.25)
        contentTypeLabel.textColor = .white
        contentTypeLabel.textAlignment = .center
        contentTypeLabel.text = contentType
        contentTypeLabel.backgroundColor = .black
        contentTypeLabel.layer.borderWidth = 1.0
        contentTypeLabel.layer.borderColor = UIColor.white.cgColor
        contentTypeLabel.layer.cornerRadius = size / 51.75
        contentTypeLabel.layer.masksToBounds = true
        coverView.addSubview(
            subview: contentTypeLabel,
            leading: size / 3.29,
            top: nil,
            trailing: size / 3.29,
            bottom: 1
        )
        NSLayoutConstraint.activate([
            contentTypeLabel.heightAnchor.constraint(equalToConstant: size / 10.35)
        ])
    }
    
    private func setupDividerView() {
        let divider = UIView()
        divider.layer.borderColor = UIColor.white.cgColor
        divider.layer.borderWidth = 1.0
        divider.isUserInteractionEnabled = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: size / 10.35),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.widthAnchor.constraint(equalToConstant: size / 1.93),
            divider.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
    private func setupGradient() {
        let locations = [NSNumber(0.51), NSNumber(1.0)]
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
}
