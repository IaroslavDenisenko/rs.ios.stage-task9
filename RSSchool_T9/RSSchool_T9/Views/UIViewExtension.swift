//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

extension UIView {
    
    func addSubview(
        subview view: UIView,
        leading: CGFloat?,
        top: CGFloat?,
        trailing: CGFloat?,
        bottom: CGFloat?
    ) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        
        if let leading = leading {
            let leadingConstraint =
                view.leadingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                    constant: leading
            )
            constraints.append(leadingConstraint)
        }
        
        if let top = top {
            let topConstraint =
                view.topAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.topAnchor,
                    constant: top
            )
            constraints.append(topConstraint)
        }
        
        if let trailing = trailing {
            let trailingConstraint =
                view.trailingAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                    constant: -trailing
            )
            constraints.append(trailingConstraint)
        }
        
        if let bottom = bottom {
            let bottomConstraint =
                view.bottomAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                    constant: -bottom
            )
            constraints.append(bottomConstraint)
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addGradient(
        colors: [Any],
        startPoint: CGPoint,
        endPoint: CGPoint,
        opacity: Float,
        location: [NSNumber]?
    ) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.opacity = opacity
        gradientLayer.locations = location
        layer.addSublayer(gradientLayer)
        return gradientLayer
    }
}
