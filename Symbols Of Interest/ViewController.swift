//
//  ViewController.swift
//  Symbols Of Interest
//
//  Created by Aaqib Hussain on 01/04/2015.
//  Copyright (c) 2015 Aaqib Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate  {
    
    
    //ImageView on the Back
    @IBOutlet weak var browseImage: UIImageView!
    //ImageView on the Front with
    @IBOutlet weak var frameView: UIImageView!
    var imageIndex = 0;
    let maxIndex = 10;
    
    var imagepicker = UIImagePickerController()
    
    
    //Alerts user to choose medium to load picture
    @IBAction func chooseMedium(sender: AnyObject) {
        let alertController = UIAlertController(title: "Please Choose the Medium", message: "", preferredStyle: .Alert);
        let galleryAction = UIAlertAction(title: "Photo Gallery", style: UIAlertActionStyle.Default){
            UIAlertAction in
            self.gallery();
            
        }
        
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default){
            UIAlertAction in
            self.takePicture();
            
        }
        alertController.addAction(galleryAction)
        alertController.addAction(cameraAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    func gallery(){
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum))
        {
           // println("Button CApture");
            //imagepicker.delegate = self;
            imagepicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagepicker.allowsEditing = false
            self.presentViewController(imagepicker, animated: true, completion: nil)
            
            
        }
        
        
        
        
    }
    
    
    //If no camera is found
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera Detected", message: "Sorry this device has no Camera", preferredStyle:.Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
        
        
    }
    // Saving Image
    @IBAction func saveImage(sender: AnyObject) {
        
        if (browseImage.image != nil)
        {
        //bottom image
            let bottomImage: UIImage = self.browseImage.image!
            let topImage: UIImage = self.frameView.image!
            
        
            let newBSize: CGSize = CGSizeMake(bottomImage.size.width, bottomImage.size.height)
            let newTSize: CGSize = CGSizeMake(topImage.size.width, topImage.size.height)
            
            UIGraphicsBeginImageContext(newBSize)
            UIGraphicsBeginImageContext(newTSize)
            
            bottomImage.drawInRect(CGRectMake(0, 0, newBSize.width, newBSize.height))
            topImage.drawInRect(CGRectMake(0,0, newTSize.width, newTSize.height))
            
            let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
            //var imageData = UIImageJPEGRepresentation(newImage, 1.0)
            
        
            
            
            
        
        
        
        UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)
        let alert: UIAlertView = UIAlertView()
        alert.title = "Saved!"
        alert.message = "Picture was saved successfully"
        alert.delegate = self
        alert.addButtonWithTitle("OK")
        alert.show()
        }
        //Throw error if no image has been browsed
        if (browseImage.image == nil)
        {
            let error: UIAlertView = UIAlertView()
            error.title = "Sorry!"
            error.message = "Add a picture first to proceed"
            error.delegate = self
            error.addButtonWithTitle("OK")
            error.show()
            
        
        }
    }
    func takePicture()
    {
        if((UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil || UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil))
        {
            imagepicker.allowsEditing = false
            imagepicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagepicker.cameraCaptureMode = .Photo
            presentViewController(imagepicker, animated: true, completion: nil)
            
            
        }
        else {
            noCamera()
            
        }
        
    }
    
    
    
    //Pinch zoom in and zoom out
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        
        
        let lastScaleFactor:CGFloat = 1;
        let factor:CGFloat = sender.scale;
        if(factor > 1){
            frameView.transform = CGAffineTransformMakeScale((lastScaleFactor + (factor - 1)), lastScaleFactor + (factor - 1));

        }
        else {
            frameView.transform = CGAffineTransformMakeScale(lastScaleFactor * factor, lastScaleFactor * factor);
        
        
        }
        
        
    }
    //UIImagePickerController Delegate methods
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.dismissViewControllerAnimated(true, completion: {() -> Void in })
        browseImage.image = image
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
  
    //OnSwipeGestureFrames
    @IBAction func handleSwipe(sender: UISwipeGestureRecognizer) {
        let images = ["pic9.png", "pic10.png","pic11.png","pic13.png","pic14.png","pic15.png","pic4.png","pic5.png","pic6.png","pic7.png","pic8.png"]
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"));
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"));
        
        leftSwipe.direction = .Left;
        rightSwipe.direction = .Right;
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        if(sender.direction == .Left)
        {
            imageIndex++;
            if(imageIndex > maxIndex)
            {
                imageIndex = 0;
            }
        
        }
        if(sender.direction == .Right)
        {
            imageIndex--;
           // println("RightSwiped!")
        
            if(imageIndex < 0)
            {
                imageIndex = maxIndex;
            }
        }
        //Displaying Frames in UIImageView
        frameView.image = UIImage (named:images[imageIndex])
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagepicker.delegate = self;
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

