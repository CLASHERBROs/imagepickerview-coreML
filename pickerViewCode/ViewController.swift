//
//  ViewController.swift
//  pickerViewCode
//
//  Created by paritosh on 15/04/20.
//  Copyright © 2020 paritosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
       override func viewDidLoad() {
           super.viewDidLoad()
           imagePicker.delegate = self
                  imagePicker.sourceType = .camera
                  imagePicker.allowsEditing = false
           // Do any additional setup after loading the view.
       }
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             if let userPickedImage = info[.originalImage] as? UIImage
             {  imageView.image = userPickedImage
      //uncomment below two lines to convert to CI Image
                
                //  guard let ciImage = CIImage(image:userPickedImage) else{
          //       fatalError()
                  
       //       }
    
        }
        
              imagePicker.dismiss(animated: true, completion: nil)
              
              
          }
          

    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
         present(imagePicker, animated: true, completion: nil)
    }
    
}

