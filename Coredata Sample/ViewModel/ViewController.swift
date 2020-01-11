//
//  ViewController.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var userArray :[DogList]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
         getValues()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
    }
    
    func getValues() {
        let context = appDelegate.persistentContainer.viewContext
        let request = DogList.createFetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            userArray = try context.fetch(request)
        } catch {
            print("Failed")
        }

}
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return userArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
    
        tablecell.userObj = (userArray?[indexPath.row])!
        
        return tablecell
    }
    
}



