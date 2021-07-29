//
//  ImageViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 26/07/21.
//

import UIKit
import Photos

class ImageViewController: UIViewController, UIContextMenuInteractionDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    //botão de voltar e context menu
    @IBOutlet weak var voltarButton: UIButton!
    @IBOutlet weak var goToCamButton: UIButton!
    @IBOutlet weak var activePhotoButton: UIButton!
    
    //camera/galeria
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    
    //parte da permissão e uso da camera ou galeria
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        checkPermissions()
}
    
    @IBAction func tappedCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func tappedLibraryButton(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    
    
    func checkPermissions() {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in ()
            })
        }
        
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
        } else {
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    
    func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            print("Access granted to use Photo Library")
        } else {
            print("We don't have access to yout Photos")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.main.async {
            if picker.sourceType == .photoLibrary {
                if let foto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    let caminho = FileHelper.SaveToFiles(image: foto)
                    self.image.image = UIImage(contentsOfFile: FileHelper.GetFilePath(fileName: caminho))
                    
                }
                
                //image?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            }
            else {
                self.image?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            }
        }
       // if picker.sourceType == .photoLibrary {
           // if let foto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
              //  let caminho = FileHelper.SaveToFiles(image: foto)
               // image.image = UIImage(contentsOfFile: FileHelper.GetFilePath(fileName: caminho))
                
          //  }
            
            //image?.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
       // }
       // else {
         //   image?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
       // }
        
        picker.dismiss(animated: true, completion: nil)
    }
    

    
    //context menu
    @IBAction func activePhotoActButton(_ sender: Any) {
        let menuInteraction1 = UIContextMenuInteraction(delegate: self)
         activePhotoButton.addInteraction(menuInteraction1)
        print("helló")
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) { _ in
            
            let gallery = UIAction(title: "Gallery", image: UIImage(systemName: "photo")) { _ in
                print("Gallery was selected")
            }
            
            let camera = UIAction(title: "Camera",  image: UIImage(systemName: "camera")) { _ in
                print("Camera was selected")
        
            }
            
            return UIMenu(title: "Import Image", children: [gallery, camera])
        }
    
}

    
    //botão de voltar
    @IBAction func voltarActButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}


    
    
    
    
    



