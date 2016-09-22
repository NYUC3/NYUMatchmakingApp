//
//  ProjectObject.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import Foundation

struct Project {
    
    init(name : String, desc : String, image : NSData){
        self.name = name
        self.description = desc
        self.image = image
    }
    
    var name : String?
    var description : String?
    var image : NSData?
    
}
