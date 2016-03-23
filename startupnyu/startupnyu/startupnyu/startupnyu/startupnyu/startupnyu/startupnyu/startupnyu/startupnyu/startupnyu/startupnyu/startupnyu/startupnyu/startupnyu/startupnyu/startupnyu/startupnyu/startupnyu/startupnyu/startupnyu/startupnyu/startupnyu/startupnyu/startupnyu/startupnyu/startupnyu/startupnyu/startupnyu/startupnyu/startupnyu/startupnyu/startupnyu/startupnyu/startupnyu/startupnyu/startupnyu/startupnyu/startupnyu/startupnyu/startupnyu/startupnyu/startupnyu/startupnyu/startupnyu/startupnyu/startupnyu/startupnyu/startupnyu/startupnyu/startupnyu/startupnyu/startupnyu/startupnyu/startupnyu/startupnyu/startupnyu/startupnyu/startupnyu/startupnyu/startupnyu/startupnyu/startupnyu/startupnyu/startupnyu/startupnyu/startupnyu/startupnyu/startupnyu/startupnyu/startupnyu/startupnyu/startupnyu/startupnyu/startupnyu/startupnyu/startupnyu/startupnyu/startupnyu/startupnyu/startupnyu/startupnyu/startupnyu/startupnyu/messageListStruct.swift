//
//  messageListStruct.swift
//  startupnyu
//
//  Created by Vidyadhar V. Thatte on 1/16/16.
//  Copyright © 2016 Polymafia. All rights reserved.
//

import Foundation

struct messageList {
    init( name: String, image: String ){
        self.name = name
        self.image = image
    }
    var name : String?
    var image : String?
}