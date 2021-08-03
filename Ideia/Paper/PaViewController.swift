//
//  PaViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 22/07/21.
//

import UIKit

class PaViewController: UIViewController {

 
    
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
        paCollection.delegate = self
        if let pages = note?.pages?.array as? [Page]{
            self.pages = pages
            if pages.isEmpty{
            let page =  try! CoreDataStackPage.createPage(pageImage: "paper", note: note!)
                self.pages.append(page)
            }
        }
        
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
//                paCollection.addGestureRecognizer(longPress)
    }
    
    @IBAction func actionPaButton(_ sender: Any) {
       // testess.append(PaCollectionCellContent(image: UIImage(named:"paper")!))
        let page = try! CoreDataStackPage.createPage(pageImage: "paper", note: note!)
        pages.append(page)
        paCollection.reloadData()
    }
    
//    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
//
//        if sender.state == .began {
//            let touchPoint = sender.location(in: paCollection)
//            if let indexPath = paCollection.indexPathForItem(at: touchPoint) {
//                let ac = UIAlertController(title: "Do you really wanna delete this page?", message: nil, preferredStyle: .actionSheet)
//                ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {
//                    [weak self] action in
//
//                    let pageData = try! CoreDataStackPage.getPage()
//
//
//                    try! CoreDataStackPage.deletePage(page: pageData[indexPath.row])
//
//                    self?.paCollection.reloadData()
//
//
//
//                }))
//                ac.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
//                present(ac, animated: true)
//
//
//            }
//
//        }
//    }
//
    
    
    
    @IBAction func backActButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let index = paCollection.indexPath(for: cell)!.row
        if let viewController = segue.destination as? ImageViewController{
            viewController.coreDataPage = self.pages[index]
            viewController.coreDataNote = self.note
            viewController.delegate = self
            
        }
    }

}

extension PaViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //      performSegue(withIdentifier: "paperPhoto", sender: indexPath.row)
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
        guard let path = pages[indexPath.row].photoImage, let image = UIImage(contentsOfFile: FileHelper.GetFilePath(fileName: path))
        else {
            return paCell
        }
        paCell.photoImage.image = image
        
        return paCell
        
    }
   // collectionView
    
}

extension PaViewController: imageViewControllerDelegate {
    func didSave() {
        paCollection.reloadData()
    }
}





