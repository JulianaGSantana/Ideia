//
//  PaViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 22/07/21.
//

import UIKit

class PaViewController: UIViewController, UIContextMenuInteractionDelegate {

    
    @IBOutlet weak var paCollection: UICollectionView!
    @IBOutlet weak var morePaButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
   // var conteudo: 
    var note: Note?
    var pages: [Page] = []
    
    var testess:[PaCollectionCellContent] = [
       PaCollectionCellContent(image: UIImage(named:"paper")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paCollection.dataSource = self
            //print(note)
      //  if try! CoreDataStackPage.getPage().count == 0 {
      //  _ = try! CoreDataStackPage.createPage(pageImage: "paper")}
        if let pages = note?.pages?.array as? [Page]{
            self.pages = pages
            if pages.isEmpty{
            let page =  try! CoreDataStackPage.createPage(pageImage: "paper", note: note!)
                self.pages.append(page)
            }
        }
        paCollection.reloadData()
        }
    
    @IBAction func actionPaButton(_ sender: Any) {
       // testess.append(PaCollectionCellContent(image: UIImage(named:"paper")!))
        let page = try! CoreDataStackPage.createPage(pageImage: "paper", note: note!)
        pages.append(page)
        paCollection.reloadData()
    }
    
    
    @IBAction func actionPhotoButton(_ sender: Any) {
        let menuInteraction = UIContextMenuInteraction(delegate: self)
         photoButton.addInteraction(menuInteraction)
        print("oi")
    }
    
  
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) { _ in
            
            let gallery = UIAction(title: "Gallery", image: UIImage(systemName: "photo")) { _ in
                print("Copy was selected")
            }
            
            let camera = UIAction(title: "Camera",  image: UIImage(systemName: "camera")) { _ in
                print("Share was selected")
        
            }
            
            return UIMenu(title: "Import Image", children: [gallery, camera])
        }
    
}
    @IBAction func backActButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension PaViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
            //imagee.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let paCell: PaCollectionCell =
            paCollection.dequeueReusableCell(withReuseIdentifier: "paCell", for: indexPath) as! PaCollectionCell
        paCell.image.image = UIImage (named: pages[indexPath.row].pageImage!)
    
        return paCell

        }
        
   }



