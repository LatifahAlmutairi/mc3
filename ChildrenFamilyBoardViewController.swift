//
//  ChildrenFamilyBoardViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 04/08/1443 AH.
//

import UIKit

class ChildrenFamilyBoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    @IBOutlet weak var bedtimeStoriesLabel: UILabel!
    
    
   
    @IBOutlet weak var homeWorklabel: UILabel!
    
    @IBOutlet weak var alathkarlabel: UILabel!
    
    
    var arrMembers = [itemsChildren] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemsAtArray()
       bedtimeStoriesLabel.font = UIFont(name:"SF Pro Rounded", size: 24)
       homeWorklabel.font = UIFont(name:"SF Pro Rounded", size: 24)
        alathkarlabel.font = UIFont(name:"SF Pro Rounded", size: 24)
        
        
       bedtimeStoriesLabel.isAccessibilityElement = true
        bedtimeStoriesLabel.accessibilityLabel = "BedTime Stories"
        
        
        homeWorklabel.isAccessibilityElement = true
        homeWorklabel.accessibilityLabel = "Home work"
        
        
        alathkarlabel.isAccessibilityElement = true
        alathkarlabel.accessibilityLabel = "Alathkar"
        
        
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setItemsAtArray(){
        arrMembers.append(itemsChildren(name: "Raged", score: "1200", image: UIImage(named: "avatar1")!))
        arrMembers.append(itemsChildren(name: "Latifah", score: "800", image: UIImage(named: "avatar8")!))
        arrMembers.append(itemsChildren(name: "Reof", score: "900", image: UIImage(named: "avatar2")!))
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMembers.count
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenMembersCollectionViewCell", for: indexPath) as! ChildrenMembersCollectionViewCell
        
        
        let item1 = arrMembers[indexPath.row]
        cell.setupCell(avatar: item1.image, name: item1.name, score: item1.score)
        

        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
    }
    
    


}


struct itemsChildren {
    var name : String
    var score : String
    var image : UIImage
}
