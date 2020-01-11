//
//  AddDogListViewController.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AddDogListViewController: UIViewController {
    
    @IBOutlet weak var dogNameTxt : UITextField!
    @IBOutlet weak var ownerNameTxt : UITextField!
    @IBOutlet weak var dogDescriptionTxt : UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    @IBAction func saveDog(_sender : UIButton) {
        
        guard  let dogname = dogNameTxt.text else {
                return
        }
        guard  let ownername = ownerNameTxt.text else {
            return
        }
        guard  let dogdescription = dogDescriptionTxt.text else {
            return
        }
        
        DBManager.sharedInstance.addImageHistory(dogName: dogname, ownername: ownername ,dogDescription: dogdescription)
        
        
    }
    @IBAction func selectPhoto(_sender: UIButton){
        
        let imagePicker = UIImagePickerController(_, picker: UIImagePickerController, didFinishPickingMediaWithInfo, info: [String: Any]){
            
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            {
                imageV1.image = image
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}
