//
//  StoryPageViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 27/07/1443 AH.
//

import UIKit

class StoryPageViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource  {
        
    @IBOutlet weak var MytableView: UITableView!
    
    
    //var receivedAudio:URL?
    
    var colorB : [UIColor] = [ .init(named: "MedPurple")!,.init(named: "MedPink")!,.init(named: "MedBlue")!, .init(named: "MedPink")!]
    
    var stories = [Story] ()
    
    
    
    
    
    //        stories.append(Story(name: "Alice in Wonderland", color: UIColor(named: "MidPurple")!, imageStory: UIImage(named: "wonderland 1")!, headphoneImage: UIImage(systemName: "beats.headphones")!),
    //
    //        stories.init(name: "Red Riding Hood", color: UIColor(named: "MidPink")!, imageStory: UIImage(named: "little-red-riding-hood 1")!, headphoneImage: UIImage(systemName: "beats.headphones")!),
    //
    //
    //        stories.init(name: "Superman", color: UIColor(named: "MidBlue")!, imageStory: UIImage(named: "superhero 1")!, headphoneImage: UIImage(systemName: "beats.headphones")!),
    //
    //
    //        stories.init(name: "The Little Prince", color: UIColor(named: "MidPink")!, imageStory: UIImage(named: "superhero 1")!, headphoneImage: UIImage(systemName: "beats.headphones")!),
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigueStories()
        MytableView.dataSource = self
        MytableView.delegate = self
    }
    
    func ConfigueStories(){
        
        
        stories.append(Story(name: "Alice in Wonderland" , imageHeadPhone: UIImage(systemName: "beats.headphones")!, imageName: UIImage(named: "AliceInWonderLand")! , trackName: "AliceInWonderLand1", color:  UIColor(named: "MedPurple")!))
        
        stories.append(Story(name: "Red Riding Hood" , imageHeadPhone: UIImage(systemName: "beats.headphones")!, imageName: UIImage(named: "RedRidingHood")! , trackName: "RedRidingHood1", color:  UIColor(named: "MedPink")!))
        
        
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryTableViewCell
        
        let story = stories[indexPath.row]
        
        cell.setupCell(storyImage: story.imageName, headphoneImage: story.imageHeadPhone, name1: story.name)
        
        
        let color = colorB[indexPath.row]
        
        // cell.backgroundOurView.backgroundColor = color
        
        cell.backgroundOurView.backgroundColor = color
        cell.headphone1.tintColor = .white
        
        
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
        
        let vc = storyboard!.instantiateViewController(withIdentifier: "player") as! PlayerViewController
//        let vc = PlayerViewController()
        
        vc.stories = stories
        vc.position = position
        
        present(vc, animated: true)
        
        
    }
    
    
}


struct Story{
    let name: String
    let imageHeadPhone: UIImage
    let imageName: UIImage
    let trackName: String
    var color: UIColor
    
}




