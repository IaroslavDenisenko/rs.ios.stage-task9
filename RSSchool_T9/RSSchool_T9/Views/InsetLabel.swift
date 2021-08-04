//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class InsetLabel: UILabel {

    var contentInsets = UIEdgeInsets.zero

    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsets(to: super.sizeThatFits(size))
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines n: Int) -> CGRect {
        let insectBounds = bounds.inset(by: contentInsets)
        return super.textRect(forBounds: insectBounds, limitedToNumberOfLines: n)
    }

    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

}
