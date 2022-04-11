//
//  HomeWorkViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 01/08/1443 AH.
//

import UIKit

class HomeWorkViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {



    @IBOutlet weak var MytableView: UITableView!
    
    var colorB : [UIColor] = [ .init(named: "MedPurple")!,.init(named: "MedPink")!,.init(named: "MedBlue")!, .init(named: "MedPink")!]
    
   //var cellHomeWork = [Info] ()
    var arrNames = ["Raged", "Latifah"]
    var arrAvatars = [UIImage(named: "avatar1"),UIImage(named: "avatar8")]
    var arrDidHomeWork = ["did home work","did home work"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigueCells()
        MytableView.dataSource = self
        MytableView.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    func ConfigueCells(){
        
       // cellHomeWork.append(Info(name: "Raged",image: UIImage(named: "avatar1")!, label: "did home work", colo: UIColor(named: "MedPink")!))
    }
    
    





func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrAvatars.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! homeWorkTableViewCell
    
    // let info = arrAvatars[indexPath.row]
    
    cell.name1.text = arrNames[indexPath.row]
    cell.image1.image = arrAvatars[indexPath.row]
    cell.label.text = arrDidHomeWork[indexPath.row]
    
   // cell.setupCell(Image11: info.image  , label1:info.label , name11: info.name)
    
    let color = colorB[indexPath.row]
    
    cell.backgroundOurView.backgroundColor = color
    
    return cell
    
 

}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DisplayHomeWorkViewController")
            as? DisplayHomeWorkViewController{

    
            vc.name1 = arrNames[indexPath.row]
            vc.img = arrAvatars[indexPath.row]!
            
            vc.modalPresentationStyle = .pageSheet
            vc.sheetPresentationController?.detents = [.medium(), .large()]
            
            
            self.navigationController?.present(vc, animated: true, completion: nil)
            
            
            
            
            
        }
        
    
    }
    
    
    
    
    
}


struct Info {
    let name: String
    let image : UIImage
    let label : String
    var colo: UIColor
}
