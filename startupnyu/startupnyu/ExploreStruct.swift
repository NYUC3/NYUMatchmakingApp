//
//  ExploreStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/24/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import Foundation

struct ExploreStruct {
    
    init( name : String, tags : String? ){
        self.name = name
        self.tags = tags
    }
    
    var name : String?
    var tags : String?
}