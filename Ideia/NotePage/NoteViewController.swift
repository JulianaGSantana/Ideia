//
//  NoteViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 20/07/21.
//

import UIKit

class NoteViewController: UIViewController {

    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var testeButton: UIButton!
    @IBOutlet weak var noteCollection: UICollectionView!
//    var testes:[NoteCollectionCellContent] = [
//        NoteCollectionCellContent(notes: UIImage(named: "note1")!),
//        NoteCollectionCellContent(notes: UIImage(named: "note2")!),
//    ]
    
    //var testes: [String] = [ "note1", "note2"
    //]
    
 
    
    
    var selectedIndex: Int = 0
    var cadernos: [String] = ["note1", "note2", "note3", "note4", "note5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteCollection.dataSource = self
        noteCollection.delegate = self
        if try! CoreDataStackNote.getNote().count == 0 {
          _ =  try! CoreDataStackNote.createNote(noteImage: "note1")
          _ =  try! CoreDataStackNote.createNote(noteImage: "note2")
        }
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onTap(_ sender: Any) {
        //let numeroCores = Int.random(in: 0..<self.cores.count)
        //testes.append(NoteCollectionCellContent(notes: UIImage(named: "note3")!))
       // testes.append("note3")
        _ = try! CoreDataStackNote.createNote(noteImage: cadernos[Int.random(in: 0..<cadernos.count)])
        
        noteCollection.reloadData()
    }
    
    }

extension NoteViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return testes.count
        return try! CoreDataStackNote.getNote().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let noteCell: NoteCollectionCell =
            noteCollection.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCollectionCell
        let notas = try! CoreDataStackNote.getNote()
        
        //noteCell.notes.image = testes[indexPath.row].notes
        noteCell.notes.image = UIImage(named: notas[indexPath.row].noteImage!)
        return noteCell
    }
    
    
    
}

extension NoteViewController: UICollectionViewDelegate{
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
     
        if let vc = storyboard?.instantiateViewController(identifier: "paginas") as? PaViewController {
          //  vc.testess = indexPath.item
            vc.note = try! CoreDataStackNote.getNote() [indexPath.row]
            self.present(vc, animated: true, completion: nil)
            
        }
    selectedIndex = indexPath.row
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! PaViewController
        //tá criando a mesma página, a mesma coisa. Cada caderno está com os mesmos conteúdos
        vc.testess = [PaCollectionCellContent(image: UIImage(named: "paper")!)]
        vc.note = try! CoreDataStackNote.getNote() [selectedIndex]
        
   }
}

