//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailViewController: CoverViewController {
    
    private var storyText: String?
    private var storyPaths: [CGPath]?
    private var images: [UIImage]?
    private var paintVC: PaintViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func configure(for content: ContentType) {
        switch content {
        case .gallery(let gallery):
            self.coverImage = gallery.coverImage
            self.coverTitle = gallery.title
            self.contentType = gallery.type
            self.images = gallery.images
        case .story(let story):
            self.coverImage = story.coverImage
            self.coverTitle = story.title
            self.contentType = story.type
            self.storyText = story.text
            self.storyPaths = story.paths
        }
    }
}

private extension DetailViewController {
    
    private func setupViews() {
        if contentType == "Story" {
            setupStoryScrollView()
            setupStoryLabel()
        } else {
            setupImagesStack()
        }
    }
    
    private func setupStoryScrollView() {
        
        paintVC = PaintViewController()
        paintVC.paths = storyPaths
        addChild(paintVC)
        scrollView.addSubview(paintVC.view)
        paintVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paintVC.view.widthAnchor.constraint(equalToConstant: size * 0.9),
            paintVC.view.heightAnchor.constraint(equalToConstant: 100),
            paintVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paintVC.view.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: size / 5.18)
        ])
        
        paintVC.didMove(toParent: self)
    }
    
    private func setupStoryLabel() {
        let label = InsetLabel()
        label.contentInsets = UIEdgeInsets(
            top: size / 13.8,
            left: size / 13.8,
            bottom: size / 13.8,
            right: size / 10.35
        )
        label.text = storyText
        label.textColor = .white
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: "Rockwell-Regular", size: size / 17.25)
        label.backgroundColor = .clear
        label.isUserInteractionEnabled = false
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.cornerRadius = size / 51.75
        label.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: size * 0.9),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: paintVC.view.bottomAnchor, constant: 10.35),
            label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
    }
    
    private func setupImagesStack() {
        guard let images = images else { return }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = size / 20.7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: size / 5.18),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -size / 13.8),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        for image in images {
            let imageButton = UIButton()
            let padding = size / 41.4
            imageButton.setImage(image, for: .normal)
            imageButton.addTarget(
                self,
                action: #selector(imageTapped(_:)),
                for: .touchUpInside
            )
            imageButton.imageView?.contentMode = .scaleAspectFill
            imageButton.contentEdgeInsets = UIEdgeInsets(
                top: padding, left: padding, bottom: padding, right: padding)
            imageButton.layer.borderWidth = 1.0
            imageButton.layer.borderColor = UIColor.white.cgColor
            imageButton.layer.cornerRadius = size / 51.75
            imageButton.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(imageButton)
            NSLayoutConstraint.activate([
                imageButton.widthAnchor.constraint(equalToConstant: size * 0.9),
                imageButton.heightAnchor.constraint(equalToConstant: size * 1.23)
            ])
        }
    }
    
    @objc
    private func imageTapped(_ sender: UIButton) {
        let imageVC = ImageViewController()
        imageVC.image = sender.imageView?.image
        imageVC.modalPresentationStyle = .fullScreen
        present(imageVC, animated: true)
    }
    
}
