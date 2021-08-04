//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Iaroslav Denisenko
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

final class PaintViewController: UIViewController {
    
    private var timer: CADisplayLink?
    private var strokeEnd: CGFloat = 0
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var shapeLayers: [CAShapeLayer] = []
    var paths: [CGPath]?
    private let isDrawingEnabled = Settings.shared().isDrawing
    private let strokeColor = Settings.shared().color
    private let interval: TimeInterval = 1 / 60
    private var drawingTime: TimeInterval = 3
    lazy private var strokeDelta = CGFloat(self.interval / self.drawingTime)
    private var scrollCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        setupScrollView()
        setupContentView()
        setupShapesLayer(with: paths)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTimer()
    }
    
    func setDrawingTime(_ time: TimeInterval) {
        drawingTime = time
    }
    
    deinit {
        timer?.invalidate()
    }
}

private extension PaintViewController {
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = false
        
        view.addSubview(
            subview: scrollView,
            leading: 0, top: 0, trailing: 0, bottom: 0
        )
    }
    
    private func setupContentView() {
        contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 495),
            contentView.heightAnchor.constraint(equalToConstant: 100),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            )
        ])
    }
    
    private func setupShapesLayer(with paths:[CGPath]?) {
        guard let paths = paths else { return }
        for (index, path) in paths.enumerated() {
            let layer = CAShapeLayer()
            layer.backgroundColor = UIColor.black.cgColor
            layer.strokeEnd = 0
            layer.opacity = 1.0
            layer.lineWidth = 1.0
            layer.lineCap = .round
            layer.lineJoin = .round
            layer.fillColor = UIColor.clear.cgColor
            layer.strokeColor = UIColor.init(fromHexString: strokeColor).cgColor
            layer.frame = CGRect(
                x: 50 + 175 * CGFloat(index),
                y: 12,
                width: 75,
                height: 75
            )
            contentView.layer.addSublayer(layer)
            layer.path = path
            shapeLayers.append(layer)
        }
    }
    
    private func setupTimer() {
        timer = CADisplayLink(target: self, selector: #selector(drawStories))
        timer?.add(to: .current, forMode: .common)
    }
    
    private func drawImages() {
        guard isDrawingEnabled else {
            shapeLayers.forEach {
                $0.strokeEnd = 1
            }
            return
        }
        
        let newTimer = CADisplayLink(target: self, selector: #selector(self.drawStories))
        newTimer.add(to: .current, forMode: .common)
    }
    
    @objc
    private func drawStories(_ timer: CADisplayLink) {
        
        if !isDrawingEnabled {
            shapeLayers.forEach {
                $0.strokeEnd = 1
            }
        } else {
            if self.scrollCount == 0 {
                self.shapeLayers[0].strokeEnd = strokeEnd
                self.shapeLayers[1].strokeEnd = strokeEnd
            } else if self.scrollCount % 2 == 1 {
                self.shapeLayers[2].strokeEnd = strokeEnd
            } else {
                self.shapeLayers[0].strokeEnd = strokeEnd
            }
        }
        
        strokeEnd += self.strokeDelta
        
        if strokeEnd >= 1.3 {
            
            guard let paths = self.paths, paths.count > 2 else {
                timer.invalidate()
                return
            }
            
            strokeEnd = 0
            if self.scrollCount % 2 == 0 {
                let offset = CGPoint(x: 175, y: 0)
                self.scrollView.setContentOffset(offset, animated: true)
                self.shapeLayers[0].strokeEnd = strokeEnd
            } else {
                let offset = CGPoint.zero
                self.scrollView.setContentOffset(offset, animated: true)
                self.shapeLayers[2].strokeEnd = strokeEnd
            }
            
            self.scrollCount += 1
        }
        
    }
}
