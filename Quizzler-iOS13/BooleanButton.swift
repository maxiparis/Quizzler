//
//  BooleanButton.swift
//  Quizzler-iOS13
//
//  Created by Maximiliano París Gaete on 3/24/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class BooleanButton: UIButton {
    var value: Bool = false
     
     // MARK: - Initializers
     
     override init(frame: CGRect) {
         // Initialize with a default frame
         super.init(frame: frame)
     }
     
     required init?(coder aDecoder: NSCoder) {
         // Required initializer for Interface Builder
         super.init(coder: aDecoder)
     }
}
