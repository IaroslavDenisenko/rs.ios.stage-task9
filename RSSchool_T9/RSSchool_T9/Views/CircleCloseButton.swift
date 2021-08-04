//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CircleCloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtonAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Active clickable area for UIButton with rounded corners

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let radius = self.bounds.size.width / 2;
        var point = CGPoint.zero
        if let touch = touches.first {
            point = touch.location(in: superview)
        }

        let distance = sqrt(powf(Float((self.center.x - point.x)), 2) + powf(Float((self.center.y - point.y)), 2));

        if distance < Float(radius) {
            super.touchesBegan(touches, with: event)
        }
    }
    
    private func setupButtonAppearance() {
        let buttonImage = UIImage(systemName: "xmark")
        setImage(buttonImage, for: .normal)
        backgroundColor = .clear
        tintColor = .white
        layer.cornerRadius = bounds.size.width / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}
