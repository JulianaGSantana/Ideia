//
//  ViewController.swift
//  Ideia
//
//  Created by Juliana Santana on 16/07/21.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var noteButton: UIButton!
   
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var firstCollection: UICollectionView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var ideas: [Idea] = [
        Idea (content: "Pixel art", type: .styles),
        Idea (content: "Doodle art", type: .styles),
        Idea (content: "Chibi", type: .styles),
        Idea (content: "Cartoon", type: .styles),
        Idea (content: "Comic books", type: .styles),
        Idea (content: "Manga", type: .styles),
        Idea (content: "Continuous line", type: .styles),
        Idea (content: "Caricature", type: .styles),
        Idea (content: "Zentangle", type: .styles),
        Idea (content: "Realism", type: .styles),
        Idea (content: "Hyper-realism", type: .styles),
        
        
        Idea (content: "Pizza", type: .food),
        Idea (content: "Apple", type: .food),
        Idea (content: "Banana", type: .food),
        Idea (content: "Watermelon", type: .food),
        Idea (content: "Broccoli", type: .food),
        Idea (content: "Lollipop", type: .food),
        Idea (content: "Lasagna", type: .food),
        Idea (content: "Chocolate", type: .food),
        Idea (content: "Pancake", type: .food),
        Idea (content: "Shrimp", type: .food),
        Idea (content: "Fish", type: .food),
        Idea (content: "Sushi", type: .food),
        
        Idea (content: "Sad", type: .feelings),
        Idea (content: "Happy", type: .feelings),
        Idea (content: "Surprised", type: .feelings),
        Idea (content: "Remorse", type: .feelings),
        Idea (content: "Revenge", type: .feelings),
        Idea (content: "Loneliness", type: .feelings),
        Idea (content: "Anger", type: .feelings),
        Idea (content: "Emptiness", type: .feelings),
        Idea (content: "Hopeful", type: .feelings),
        
        Idea (content: "Pencil", type: .tool),
        Idea (content: "Pen", type: .tool),
        Idea (content: "Fine pen", type: .tool),
        Idea (content: "Copic", type: .tool),
        Idea (content: "Ink", type: .tool),
        Idea (content: "Crayon", type: .tool),
        Idea (content: "Watercolor", type: .tool),
        Idea (content: "Gouache", type: .tool),
        Idea (content: "Acrylic paint", type: .tool),
        Idea (content: "Newspaper", type: .tool),
        Idea (content: "Clay", type: .tool),
        Idea (content: "Wood", type: .tool),
        Idea (content: "Canvas", type: .tool),
        Idea (content: "Paper", type: .tool),
        Idea (content: "Fabric", type: .tool),
        
        Idea (content: "Sad orca", type: .sentences),
        Idea (content: "Banana waving", type: .sentences),
        Idea (content: "Flying windows", type: .sentences),
        Idea (content: "Broken mirror", type: .sentences),
        Idea (content: "Duck flying", type: .sentences),
        Idea (content: "Orange wearing a hat", type: .sentences),
        Idea (content: "Angry cell phone", type: .sentences),
        Idea (content: "A cat party", type: .sentences),
        Idea (content: "Burger shower in a city", type: .sentences),
        Idea (content: "Emo christmas tree", type: .sentences),
      
        
        Idea (content: "A", type: .alphabet),
        Idea (content: "B", type: .alphabet),
        Idea (content: "C", type: .alphabet),
        Idea (content: "D", type: .alphabet),
        Idea (content: "E", type: .alphabet),
        Idea (content: "F", type: .alphabet),
        Idea (content: "G", type: .alphabet),
        Idea (content: "H", type: .alphabet),
        Idea (content: "I", type: .alphabet),
        Idea (content: "J", type: .alphabet),
        Idea (content: "K", type: .alphabet),
        Idea (content: "L", type: .alphabet),
        Idea (content: "M", type: .alphabet),
        Idea (content: "N", type: .alphabet),
        Idea (content: "O", type: .alphabet),
        Idea (content: "P", type: .alphabet),
        Idea (content: "Q", type: .alphabet),
        Idea (content: "R", type: .alphabet),
        Idea (content: "S", type: .alphabet),
        Idea (content: "T", type: .alphabet),
        Idea (content: "U", type: .alphabet),
        Idea (content: "V", type: .alphabet),
        Idea (content: "W", type: .alphabet),
        Idea (content: "X", type: .alphabet),
        Idea (content: "Y", type: .alphabet),
        Idea (content: "Z", type: .alphabet),
        
        Idea (content: "Leg", type: .anatomia),
        Idea (content: "Arm", type: .anatomia),
        Idea (content: "Hand", type: .anatomia),
        Idea (content: "Fingers", type: .anatomia),
        Idea (content: "Shoulder", type: .anatomia),
        Idea (content: "Neck", type: .anatomia),
        Idea (content: "Face", type: .anatomia),
        Idea (content: "Mouth", type: .anatomia),
        Idea (content: "Eyes", type: .anatomia),
        Idea (content: "Nose", type: .anatomia),
        Idea (content: "Ear", type: .anatomia),
        Idea (content: "Hear", type: .anatomia),
        Idea (content: "Body", type: .anatomia),
        Idea (content: "Extended arm", type: .anatomia),
        Idea (content: "Flexed arm", type: .anatomia),
        Idea (content: "Extended leg", type: .anatomia),
        Idea (content: "Flexed leg", type: .anatomia),
        Idea (content: "Chest", type: .anatomia),
        Idea (content: "Foot", type: .anatomia),
        
        Idea (content: "Dog", type: .animal),
        Idea (content: "Fish", type: .animal),
        Idea (content: "Rhino", type: .animal),
        Idea (content: "Zebra", type: .animal),
        Idea (content: "Horse", type: .animal),
        Idea (content: "Cow", type: .animal),
        Idea (content: "Ox", type: .animal),
        Idea (content: "Dolphin", type: .animal),
        Idea (content: "Cat", type: .animal),
        Idea (content: "Guinea pig", type: .animal),
        Idea (content: "Mouse", type: .animal),
        Idea (content: "Bird", type: .animal),
        Idea (content: "Eagle", type: .animal),
        
        Idea (content: "Vase", type: .object),
        Idea (content: "Computer", type: .object),
        Idea (content: "Frame", type: .object),
        Idea (content: "Table", type: .object),
        Idea (content: "Window", type: .object),
        Idea (content: "Lamp", type: .object),
        Idea (content: "Brush", type: .object),
        Idea (content: "Cage", type: .object),
        Idea (content: "Cell phone", type: .object),
        Idea (content: "Notebook", type: .object),
        
        Idea (content: "Black", type: .cor),
        Idea (content: "White", type: .cor),
        Idea (content: "Blue", type: .cor),
        Idea (content: "Pink", type: .cor),
        Idea (content: "Red", type: .cor),
        Idea (content: "Yellow", type: .cor),
        Idea (content: "Orange", type: .cor),
        Idea (content: "Violet", type: .cor),
        Idea (content: "Silver", type: .cor),
        Idea (content: "Gold", type: .cor),
        Idea (content: "Gray", type: .cor),
    ]
    
   
    
    var allIdeaTypes = IdeaType.allCases
    
    var data:[FirstCollectionCellContent] = [
        FirstCollectionCellContent (title: "Styles theme", image: UIImage(named: "styles")!),
        FirstCollectionCellContent (title: "Food theme", image: UIImage(named: "food")!),
        FirstCollectionCellContent (title: "Feelings theme", image: UIImage(named: "feelings")!),
        FirstCollectionCellContent (title: "Tool theme", image: UIImage(named: "tool")!),
        FirstCollectionCellContent (title: "Sentences theme", image: UIImage(named: "sentences")!),
        FirstCollectionCellContent (title: "Alphabet theme", image: UIImage(named: "alphabet")!),
        FirstCollectionCellContent (title: "Anatomy theme", image: UIImage(named:"anatomy")!),
        FirstCollectionCellContent (title: "Animal theme", image: UIImage(named:"animal")!),
        FirstCollectionCellContent (title: "Object theme", image: UIImage(named: "object")!),
        FirstCollectionCellContent (title: "Colors theme", image: UIImage(named: "colors")!)
    ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCollection.delegate = self
        firstCollection.dataSource = self
    }
    

}



extension MainViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FirstCollectionCell = firstCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FirstCollectionCell
    
        cell.labelFirst.text = data[indexPath.row].title
        cell.image.image = data[indexPath.row].image
        cell.ideaType = allIdeaTypes[indexPath.row].self
        HapticsManager.shared.vibrate(for: .success)
        return cell
    }
    
    
  
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FirstCollectionCell
        HapticsManager.shared.vibrate(for: .success)
        let idea = ideas.filter({ idea in
            idea.type == cell.ideaType}).randomElement()
       
        label.text = idea?.content
        titleLabel.text = cell.ideaType.title
      

    
        }
      
    }

