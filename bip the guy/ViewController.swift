//
//  ViewController.swift
//  bip the guy
//
//  Created by Ann McDonough on 2/4/20.
//  Copyright © 2020 Patrick McDonough. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  var audioPlayer = AVAudioPlayer()
var imagePicker = UIImagePickerController()

let soundVar = "sound0"
    var fileLocaion = ""
    var player: AVAudioPlayer = AVAudioPlayer()
    var playCount = 0

//Properties
@IBOutlet weak var imageToBip: UIImageView!
@IBOutlet weak var libraryButton: UIButton!
@IBOutlet weak var cameraButton: UIButton!
    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func animateImage() {
        let bounds = self.imageToBip.bounds
        let shrinkValue: CGFloat = 60
        
        // shrink our imageToPunch by 60 pixels
        self.imageToBip.bounds = CGRect(x: self.imageToBip.bounds.origin.x + shrinkValue, y: self.imageToBip.bounds.origin.y + shrinkValue, width: self.imageToBip.bounds.size.width - shrinkValue, height: self.imageToBip.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToBip.bounds = bounds }, completion: nil)
    }
    
    
    
    
    
    
    
    
    
   /* func animateImage() {
        let bounds = self.imageToBip.bounds
        let shrinkValue: CGFloat = 60
        //shrink our image to punch by 60 pixels
  self.imageToBip.bounds = CGRect(x: self.imageToBip.bounds.origin.x + shrinkValue, y: self.imageToBip.bounds.origin.y + shrinkValue, width: self.imageToBip.bounds.size.width - shrinkValue, height: self.imageToBip.bounds.size.height - shrinkValue)
   
    UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToBip.bounds = bounds }, completion: nil)
        
    
    } */
 
    func playSound(soundNamed: String, audioPlayer: inout AVAudioPlayer) {
               
           if let sound = NSDataAsset(name: "sound0") {
               do {
                   try audioPlayer = AVAudioPlayer(data: sound.data)
                   audioPlayer.play()
               } catch {
                   print("😡, \(error.localizedDescription) could not initialize AVAudioPlayer" )
               }
           }
           else {
               print("😡Could not read data from file sound 0")
               
           }
           
       }
 func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
     let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
     imageToBip.image = selectedImage
    
     
     dismiss(animated: true, completion: nil)
     
 }
    
    
  /*  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
   //let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
     //imageToBip.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
 */
 
 
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        print("got into camera")
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
                 imagePicker.delegate = self
                 present(imagePicker, animated: true, completion: nil)
        }
        else{
            showAlert(title: "Camera Not Available", message: "There is no camera on this device")
        }
        
        
        
        
    }
    
    
    /*@IBAction func cameraButtonPressed1(_ sender: UIButton) {
        imagePicker.sourceType = .camera
             imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    } */

    @IBAction func libraryButtonPressed(_ sender: UIButton) {
        print("Got into library")
        imagePicker.sourceType = .photoLibrary
             imagePicker.delegate = self
               present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func imagedTapped(_ sender: UITapGestureRecognizer) {

          animateImage()
        playSound(soundNamed: "sound0", audioPlayer: &audioPlayer)
           print("Image was tapped")
        
    }
    

    
    
}

