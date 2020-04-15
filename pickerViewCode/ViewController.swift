import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
       override func viewDidLoad() {
           super.viewDidLoad()
           imagePicker.delegate = self
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
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
         alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
             self.openCamera()
         }))

         alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
             self.openGallery()
         }))

         alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

         self.present(alert, animated: true, completion: nil)
    }
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
