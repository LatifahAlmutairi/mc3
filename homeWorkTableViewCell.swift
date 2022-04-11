//
//  homeWorkTableViewCell.swift
//  MC3
//
//  Created by Latifah Almutairi on 01/08/1443 AH.
//

import UIKit

class homeWorkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var name1: UILabel!
    
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var backgroundOurView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundOurView.layer.cornerRadius = 10
        
        // Initialization code
    }
    
    
    func setupCell(Image11: UIImage ,label1: String, name11: String){
        image1.image = Image11
        name1.text = name11
        label.text = label1
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
