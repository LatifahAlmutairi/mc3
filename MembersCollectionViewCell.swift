//
//  MembersCollectionViewCell.swift
//  MC3
//
//  Created by Latifah Almutairi on 28/07/1443 AH.
//

import UIKit

class MembersCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image1: UIImageView!
    
    
    @IBOutlet weak var labelname: UILabel!
    
    @IBOutlet weak var labelscore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelname.font = UIFont(name: "SF Pro Rounded", size: 14)
        labelscore.font = UIFont(name: "SF Pro Rounded", size: 14)
        // Initialization code
    }
    
    
    
    func setupCell(avatar: UIImage, name: String, score:String){
        image1.image = avatar
        labelname.text = name
        labelscore.text = score
    }
    
    
}
