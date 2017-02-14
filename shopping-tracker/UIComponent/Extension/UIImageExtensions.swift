//
//  UIImageExtensions.swift
//  shopping-tracker
//
//  Created by Cristian Ames on 2/13/17.
//  Copyright © 2017 Cristian Ames. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public convenience init(identifier: ImageAssetIdentifier) {
        self.init(named:identifier.rawValue)!
    }
    
}
