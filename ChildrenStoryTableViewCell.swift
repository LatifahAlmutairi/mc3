//
//  ChildrenStoryTableViewCell.swift
//  MC3
//
//  Created by Latifah Almutairi on 05/08/1443 AH.
//

import UIKit

class ChildrenStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var storyName: UILabel!
    
    @IBOutlet weak var imageStory: UIImageView!
    
    @IBOutlet weak var imageHeadPhone: UIImageView!
    
    @IBOutlet weak var OurView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        OurView.layer.cornerRadius = 10
        storyName.font = UIFont(name: "SF Pro Rounded", size: 16)
        storyName.textColor = UIColor.white
        
        
    }
    
    
    func setupCell(storyImage: UIImage,headphoneImage: UIImage, name1: String){
        imageStory.image = storyImage
        imageHeadPhone.image = headphoneImage
        storyName.text = name1
     
      
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
