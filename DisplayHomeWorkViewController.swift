//
//  DisplayHomeWorkViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 02/08/1443 AH.
//

import UIKit

class DisplayHomeWorkViewController: UIViewController, UISheetPresentationControllerDelegate {

    @IBOutlet weak var avatarhomeWork: UIImageView!
    
    @IBOutlet weak var homeWorkPic: UIImageView!
    @IBOutlet weak var Namelabel: UILabel!
    
    @IBOutlet weak var Approve: UIButton!
    
    @IBOutlet weak var Decline: UIButton!
    
    var img = UIImage()
    var name1 = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Namelabel.text = name1
        avatarhomeWork.image = img
        view.backgroundColor = UIColor(named: "LightPink")
        
        Approve.tintColor  = UIColor(named: "DarkPink")
        
        Approve.layer.cornerRadius = 10
        
     
       
        Decline.tintColor = UIColor(named: "MedPink")
        Decline.layer.cornerRadius = 10

     
    }
    

    @IBAction func approveAct(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    @IBAction func declineAct(_ sender: Any) {
        dismiss(animated: true)
    }
}
