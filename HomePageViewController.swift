//
//  ViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 26/07/1443 AH.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var MyViewCollection: UICollectionView!
    
    @IBOutlet weak var bedTimeStoriesLabel: UILabel!
    @IBOutlet weak var homeworkLabel: UILabel!
    
    @IBOutlet weak var alathkarLabel: UILabel!
    
    


    var arrMembers = [items] ()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setItemsAtArray()
        bedTimeStoriesLabel.font = UIFont(name:"SF Pro Rounded", size: 24)
        homeworkLabel.font = UIFont(name:"SF Pro Rounded", size: 24)
        alathkarLabel.font = UIFont(name:"SF Pro Rounded", size: 24)
        
//        bedTimeStoriesLabel.isAccessibilityElement = true
//        bedTimeStoriesLabel.accessibilityLabel = "BedTime Stories"
       // bedTimeStoriesLabel.accessibilityHint = ""
        MyViewCollection.dataSource = self
        MyViewCollection.delegate = self
 
    }
    
    func setItemsAtArray(){
        arrMembers.append(items(name: "Raged", score: "1200", image: UIImage(named: "avatar1")!))
        arrMembers.append(items(name: "Latifah", score: "800", image: UIImage(named: "avatar8")!))
        arrMembers.append(items(name: "Reof", score: "900", image: UIImage(named: "avatar2")!))
        
        
    }
    

    @IBAction func bedtimeStoriesButton(_ sender: Any) {
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMembers.count
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCollectionViewCell", for: indexPath) as! MembersCollectionViewCell
        
        
        let item1 = arrMembers[indexPath.row]
        cell.setupCell(avatar: item1.image, name: item1.name, score: item1.score)
        

        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
    }
    
    
  
    
    //func setValue()
    
    
}


struct items {
    var name : String
    var score : String
    var image : UIImage
}



