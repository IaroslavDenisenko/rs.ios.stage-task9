//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class ScrollViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ScrollViewController {
    
    private func setupViews() {
        view.backgroundColor = .black
        setupScrollView()
        addCloseButton(to: scrollView)
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.contentSize = view.bounds.size
        view.addSubview(
            subview: scrollView,
            leading: 0, top: 0, trailing: 0, bottom: 0
        )
    }
}

extension UIViewController {
    
    func addCloseButton(to view: UIView) {
        let buttonFrame = CGRect(
            origin: CGPoint.zero,
            size: CGSize(width: 40.0, height: 40.0)
        )
        let closeButton = CircleCloseButton(frame: buttonFrame)
        closeButton.addTarget(self, action:#selector(closeButtonTapped) , for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 40.0),
            closeButton.heightAnchor.constraint(equalToConstant: 40.0),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -25.0)
        ])
    }
    
    @objc
    private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
