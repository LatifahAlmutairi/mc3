//
//  ChildrenStoryPageViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 05/08/1443 AH.
//

import UIKit

class ChildrenStoryPageViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
 

    

    @IBOutlet weak var mytableVieew: UITableView!
    
    
    
    var colorB : [UIColor] = [ .init(named: "MedPurple")!,.init(named: "MedPink")!,.init(named: "MedBlue")!, .init(named: "MedPink")!]
    
    
    var stories = [StoryChild] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigueStories()
        mytableVieew.dataSource = self
        mytableVieew.delegate = self

    }
    

    func ConfigueStories(){
        
        
        stories.append(StoryChild(name: "Alice in Wonderland" , imageHeadPhone: UIImage(systemName: "beats.headphones")!, imageName: UIImage(named: "AliceInWonderLand")! , trackName: "AliceInWonderLand1", color:  UIColor(named: "MedPurple")!))
        
        stories.append(StoryChild(name: "Red Riding Hood" , imageHeadPhone: UIImage(systemName: "beats.headphones")!, imageName: UIImage(named: "RedRidingHood")! , trackName: "RedRidingHood1", color:  UIColor(named: "MedPink")!))
        
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildStoryCell", for: indexPath) as! ChildrenStoryTableViewCell
        
        let story = stories[indexPath.row]
        cell.setupCell(storyImage: story.imageName, headphoneImage: story.imageHeadPhone, name1: story.name)
        
        let color = colorB[indexPath.row]
        
        cell.OurView.backgroundColor = color
        cell.imageHeadPhone.tintColor = .white
        
    
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row

        //stoies
        
//        var vc = PlayerViewController()
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "playerChildren") as! ChildrenPlayerStoryViewController
//        let vc = PlayerViewController()
        
        vc.stories = stories
        vc.positionChild = position
        
        present(vc, animated: true)
        
        
    }
    
    
    
    
}

struct StoryChild{
    let name: String
    let imageHeadPhone: UIImage
    let imageName: UIImage
    let trackName: String
    var color: UIColor
    
}
