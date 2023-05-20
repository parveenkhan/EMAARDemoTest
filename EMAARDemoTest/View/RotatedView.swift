//
//  RotatedView.swift
//  EMAARDemoTest
//
//  Created by Parveen Khan on 20/05/23.
//

import Foundation

public class RotatedView: UIView {
     var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBorder()
        setupLabel()
        applyRotation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBorder()
        setupLabel()
        applyRotation()
    }
    
    private func setBorder() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.yellow.cgColor

    }
    
    private func setupLabel() {
        label = UILabel()
        label.textAlignment = .center
        addSubview(label)
        label.frame = bounds
    }
    
    private func applyRotation() {
        let rotationAngle: CGFloat = .pi / 4.0 // 45 degrees
        
        // Apply rotation transformation to the view
        transform = CGAffineTransform(rotationAngle: rotationAngle)
        label.transform = CGAffineTransform(rotationAngle: -rotationAngle)
    }
}
