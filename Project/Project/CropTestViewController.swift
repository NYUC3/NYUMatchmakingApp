//
//  CropTestViewController.swift
//  Project
//
//  Created by Vidyadhar V. Thatte on 12/2/16.
//  Copyright © 2016 Vidyadhar Thatte. All rights reserved.
//

import UIKit


class CropTestViewController: UIViewController {

    
    // Do any additional setup after loading the view.
    var cropView: AKImageCropperView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "background.png")
        //let frame = CGRectMake(0, 0, 300, 300)
        let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        let frame2 = CGRect(x: 10, y: 10, width: 200, height: 200)
        cropView = AKImageCropperView(frame: frame, image: image!, showOverlayView: false)
        cropView.setCropRect(frame2)
        view.addSubview(cropView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Refreshing
        cropView.refresh()
    }
    

}
