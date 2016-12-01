//
//  FeedObject.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 9/21/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import Foundation
import Parse

struct Feed {
    
    init(name : String, title: String, desc : String, image : PFFile){
        self.name = name
        self.title = title
        self.description = desc
        self.image = image
    }
    
    var name : String?
    var title : String?
    var description : String?
    var image : PFFile?
    var isActive : Bool = false
    var noOfLikes : Int = 0
    var timestamp : String = ""
    var isLiked : Bool = false
    
}
