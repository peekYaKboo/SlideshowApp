//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 川田有紀 on 2019/04/07.
//  Copyright © 2019 jp.techacademy.yuki.kawata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var next_button: UIButton!
    @IBOutlet weak var prev_button: UIButton!
    //表示している画像の番号
    var dispimageNo = 0
    //タイマー
    var timer: Timer!
    
    var name_segue = ""
    
    @IBAction func slideShow(_ sender: Any) {
        if self.timer == nil{
            self.next_button.isEnabled = false
            self.prev_button.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        else{
            self.next_button.isEnabled = true
            self.prev_button.isEnabled = true
            timer.invalidate()
            self.timer = nil
        }
    }

    @IBAction func next(_ sender: UIButton) {
        dispimageNo += 1
        displayImage()
    }
    @IBAction func prev(_ sender: UIButton) {
        dispimageNo -= 1
        displayImage()
    }
    
    func displayImage(){
        let imageNameArray = ["UNADJUSTEDNONRAW_thumb_1f.jpg", "UNADJUSTEDNONRAW_thumb_1b.jpg", "UNADJUSTEDNONRAW_thumb_5c.jpg", "UNADJUSTEDNONRAW_thumb_5e.jpg", "UNADJUSTEDNONRAW_thumb_205.jpg", "UNADJUSTEDNONRAW_thumb_206.jpg"]
        if dispimageNo > 5{
            dispimageNo = 0
        }
        if dispimageNo < 0{
            dispimageNo = 5
        }
        let name = imageNameArray[dispimageNo]
        
        let image = UIImage(named: name)
        
        imageView.image  = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayImage()
        
    }
    @objc func updateTimer(_ timer: Timer) {
        dispimageNo += 1
        displayImage()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    @IBAction func onTapImage(_ sender: UITapGestureRecognizer) {
        if timer != nil {
            timer.invalidate()
            timer = nil
            next_button.isEnabled = true
            prev_button.isEnabled = true
        }
        performSegue(withIdentifier: "zoom", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let zoomViewController: ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.imageNo = self.dispimageNo
    }
}

