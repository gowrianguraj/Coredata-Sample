//
//  DBManager.swift
//  TestApp
//
//  Created by Akhila Haridas on 16/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit
import CoreData

class DBManager {
    
    static let sharedInstance = DBManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addImageHistory(dogName: String , ownername : String ,dogDescription : String) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "DogList", into: context) as! DogList
        entity.setValue(dogName,forKeyPath: "dogName")
        entity.setValue(dogName, forKeyPath: "owner")
        entity.setValue(dogName, forKeyPath: "dogDescription")
        do {
            try context.save()
        } catch {
            print("couldn't save")
        }
    }

}
