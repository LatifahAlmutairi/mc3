//
//  StoryTableViewCell.swift
//  MC3
//
//  Created by Latifah Almutairi on 27/07/1443 AH.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

  
    @IBOutlet weak var storyName1: UILabel!
    @IBOutlet weak var storyImage1: UIImageView!
    @IBOutlet weak var headphone1: UIImageView!
   
   
    
    @IBOutlet weak var backgroundOurView: UIView!
    
    //@IBOutlet weak var colorBackground: UIColor!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundOurView.layer.cornerRadius = 10
        storyName1.font = UIFont(name: "SF Pro Rounded", size: 16)
        storyName1.textColor = UIColor.white
        
        // Initialization code
    }
    
    func setupCell(storyImage: UIImage,headphoneImage: UIImage, name1: String){
        storyImage1.image = storyImage
        headphone1.image = headphoneImage
        storyName1.text = name1
       
     
      
        
    }
    
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }

}
