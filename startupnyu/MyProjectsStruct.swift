//
//  MyProjectsStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 4/23/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import Foundation
import Parse

struct MyProjectStruct {
    init( name : String, tags : String ){
        self.name = name
        self.tags = tags
    }
    
    var name : String
    var tags : String
}