//
//  StudentStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 6/30/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import UIKit

struct StudentStruct {
    
    var name : String
    var image : UIImage
    var oneLineBio : String
    
    init(name : String, image : UIImage, oneLineBio : String){
        
        self.name = name
        self.image = image
        self.oneLineBio = oneLineBio
        
    } //init
    
} // struct