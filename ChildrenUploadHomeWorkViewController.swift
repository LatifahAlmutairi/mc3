//
//  ChildrenUploadHomeWorkViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 06/08/1443 AH.
//

import UIKit

class ChildrenUploadHomeWorkViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var BTNuploadHW: UIButton!
    
    
    @IBOutlet weak var ButtonDone: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImage.layer.cornerRadius = 16
        uploadImage.frame = CGRect(x: 30, y: 100, width: 325, height: 401)
       BTNuploadHW.frame = CGRect(x: 30, y: 520, width: 325, height: 43)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func uploadButton(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
       
            uploadImage.image = image
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func BTNdone(_ sender: Any) {
        if let vc = presentingViewController as? DisplayHomeWorkViewController{
            vc.homeWorkPic = uploadImage
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let imageHW = uploadImage
//        let vc = segue.destination as! DisplayHomeWorkViewController
//        vc.homeWorkPic = imageHW
//    }
    
    
    
}
