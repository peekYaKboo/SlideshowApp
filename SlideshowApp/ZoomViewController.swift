//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 川田有紀 on 2019/04/07.
//  Copyright © 2019 jp.techacademy.yuki.kawata. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomimage: UIImageView!
    
    var imageNo:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageNA = ["UNADJUSTEDNONRAW_thumb_1f.jpg", "UNADJUSTEDNONRAW_thumb_1b.jpg", "UNADJUSTEDNONRAW_thumb_5c.jpg", "UNADJUSTEDNONRAW_thumb_5e.jpg", "UNADJUSTEDNONRAW_thumb_205.jpg", "UNADJUSTEDNONRAW_thumb_206.jpg"]
        let imagename = imageNA[imageNo]
        let picture = UIImage(named: imagename)
        zoomimage.image = picture
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
