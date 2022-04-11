//
//  ChildrenMembersCollectionViewCell.swift
//  MC3
//
//  Created by Latifah Almutairi on 05/08/1443 AH.
//

import UIKit

class ChildrenMembersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMember2: UIImageView!
    
    
    @IBOutlet weak var scoreMember: UILabel!
    @IBOutlet weak var nameMember: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameMember.font = UIFont(name: "SF Pro Rounded", size: 14)
        scoreMember.font = UIFont(name: "SF Pro Rounded", size: 14)
        // Initialization code
    }
    
    func setupCell(avatar: UIImage, name: String, score:String){
        imageMember2.image = avatar
        nameMember.text = name
        scoreMember.text = score
    }
    
    
}
