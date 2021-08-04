//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 28.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ItemsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "Cell"
    private let items: [ContentType] = FillingData.data
    private var itemsPerRow: UInt {
        return 2
    }
    private let sectionInsets = UIEdgeInsets(
        top: 40.0,
        left: 20.0,
        bottom: 50.0,
        right: 20.0
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ItemsViewController: UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        if let cell = cell as? ItemCell {
            let item = items[indexPath.item]
            switch item {
            case .gallery(let gallery):
                cell.configureCell(
                    title: gallery.title,
                    contentType: gallery.type,
                    image: gallery.coverImage)
            case .story(let story):
                cell.configureCell(
                    title: story.title,
                    contentType: story.type,
                    image: story.coverImage)
            }
        }
        
        return cell
    }
}

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let paddingSpace = sectionInsets.left * CGFloat(itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        let heightPerItem = widthPerItem * 1.23
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      insetForSectionAt section: Int
    ) -> UIEdgeInsets {
      return sectionInsets
    }
    
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return sectionInsets.left * 1.5
    }
}

extension ItemsViewController: UICollectionViewDelegate {
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .fullScreen
        let item = items[indexPath.item]
        detailVC.configure(for: item)
        present(detailVC, animated: true)
    }
}

private extension ItemsViewController {
    
    func setupCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
