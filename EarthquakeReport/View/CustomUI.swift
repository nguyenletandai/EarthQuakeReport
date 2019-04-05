//
//  CustomUI.swift
//  EarthquakeReport
//
//  Created by daicudu on 4/4/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit
@IBDesignable
class CustomLabel: UILabel {
    @IBInspectable
    private var cornerRadius: CGFloat = 0.0 {
        didSet {
            setLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    func setLayout() {
        if cornerRadius == -1 {
            layer.cornerRadius = frame.height*0.5
        } else {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
