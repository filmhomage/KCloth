//
//  ViewController.swift
//  KCloth
//
//  Created by JonghyunKim on 1/6/16.
//  Copyright © 2016 com.kokaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func selectImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let imageview : UIImageView = UIImageView(image: pickedImage)
            imageview.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            imageview.contentMode = .ScaleAspectFit
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageViewSelected(_:)))
            imageview.addGestureRecognizer(gesture)
            
            self.view .bringSubviewToFront(imageview)
            self.view .addSubview(imageview)
            
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imageViewSelected(tap: UITapGestureRecognizer) {
        print("imageViewSelected : \(tap)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self.view)
            print("currentPoint : \(currentPoint.x) \(currentPoint.y)")
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.locationInView(self.view)
            print("currentPoint : \(currentPoint.x) \(currentPoint.y)")
        }
    }
}

