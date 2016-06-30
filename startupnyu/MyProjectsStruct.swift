//
//  MyProjectsStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/23/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import Foundation
import UIKit

struct MyProjectStruct {
    
    init( name : String, tags : String, img: UIImage ){
        self.name = name
        self.tags = tags
        self.image = img
    } // init(_)
    
    var name : String
    var tags : String
    var image : UIImage
    
} // MyProjectStruct