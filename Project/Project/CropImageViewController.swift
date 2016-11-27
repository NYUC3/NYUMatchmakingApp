//
//  CropImageViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 11/26/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit

class CropImageViewController: UIViewController {

    var cropView: AKImageCropperView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "place.png")
        //let frame = CGRectMake(0, 0, 300, 300)
        let frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        cropView = AKImageCropperView(frame: frame, image: image!, showOverlayView: false)
        
        view.addSubview(cropView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        cropView.refresh()
    }

}
