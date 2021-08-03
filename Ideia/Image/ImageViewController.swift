//
//  ImageViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 26/07/21.
//

import UIKit
import Photos

protocol imageViewControllerDelegate: AnyObject {
    func didSave()
}

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //UIContextMenuInteractionDelegate
    
    weak var delegate: imageViewControllerDelegate?
    //botão de voltar e context menu
    @IBOutlet weak var voltarButton: UIButton!
    @IBOutlet weak var activePhotoButton: UIButton!
    
    //camera/galeria
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    
    
    //parte da permissão e uso da camera ou galeria
    var imagePickerController = UIImagePickerController()
    var coreDataNote: Note?
    var coreDataPage: Page?
    var nomeDaImagem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        checkPermissions()
        
    // UIMenu
        //activePhotoButton.addAction(UIAction(title: "", handler: { (_) in
        //    print("Default Action")
       // }), for: .touchUpInside)
        activePhotoButton.showsMenuAsPrimaryAction = true
        activePhotoButton.menu = addMenuItems()
        
        if let path = coreDataPage?.photoImage, let image = UIImage(contentsOfFile: FileHelper.GetFilePath(fileName: path)) {
            self.image.image = image
        }
        
        
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        if let coreDataPage = self.coreDataPage{
            if let path = coreDataPage.photoImage, let image = UIImage(contentsOfFile: FileHelper.GetFilePath(fileName: path)) {
                  self.image.image = image
        }
    }
    }
    //func addMenuItems in UIMenu
    func addMenuItems() -> UIMenu {
        let menuItems = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: "Gallery", image:  UIImage(systemName: "photo"),  handler: tappedLibraryButton),
            
            
            UIAction(title: "Camera", image:  UIImage(systemName: "camera"),  handler: tappedCameraButton)
        ])
        return menuItems
    }
    
     func tappedCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func tappedLibraryButton(_ sender: Any) {
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
            
            if let foto = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.image.image = foto
                let caminho = FileHelper.SaveToFiles(image: foto)
                self.coreDataPage?.photoImage = caminho
                try! CoreDataStackNote.saveContext()
            }
            
            self.delegate?.didSave()
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    //botão de voltar
    @IBAction func voltarActButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}


    
    
    
    
    



