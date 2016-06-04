//
//  ExploreStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/24/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import Foundation
import UIKit

struct ExploreStruct {
    
    init( name : String, tags : String?, img : UIImage ){
        self.name = name
        self.tags = tags
        self.image = img
    }
    
    var name : String?
    var tags : String?
    var image : UIImage?
}