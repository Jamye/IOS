//
//  ViewController.swift
//  dataTest
//
//  Created by James Ye on 3/22/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userInput: UITextField!
    
    
    //this creates an instance of the ItemObject.
    var items = [ItemObject]()
    
    //everything you do with the database/information has to go through this managedObjectContext
    //it goes through the Appdelegate to the persistentContainer
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //run the func grabAllData that fetchs infor from mOC and casts items and reload the tableView
        grabAllData()
    }

    @IBAction func addPressed(_ sender: UIButton) {
        
        let text = userInput.text!
        userInput.text = ""
        
        //this line is for inserting a new object, we pass the Entity through the mOC and cast it as an ItemObject
        let item = NSEntityDescription.insertNewObject(forEntityName: "ItemObject", into: managedObjectContext) as! ItemObject
        
        //not that we have the object from above, the line below sets the name attribute as text(userInput)
        item.name = text
        //appends item to the items list
        items.append(item)
        
        tableView.reloadData()
        saveData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell")!
        
        //add the .name attribute at the end to show
        cell.textLabel?.text = items[indexPath.row].name!
        return cell
    }
    
    //the function below is for swipe to delete,
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //swipe and click delete to check if we are getting the correct index path
        print(indexPath)
        
        //deletes the item from the object
        managedObjectContext.delete(items[indexPath.row])
        
        //deletes the item from the tableView list
        items.remove(at: indexPath.row)
        
        tableView.reloadData()
        saveData()
        
    }
    
    
    
    
    
    //core data methods
    
    func grabAllData (){
        //used to fetch from the Entity ItemObject
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemObject")
        
        //do this, try method. It acts kind of like a check. If any reason something does work, instead of crashing. Create an error message instead.
        do {
            //fetches the context
            let result = try managedObjectContext.fetch(request)
            //casts the fetched information as [ItemObject]
            items = result as! [ItemObject]
    
            tableView.reloadData()
            
        }catch{
            print(error)
        }
    }
    
    func saveData(){
        do {
            try managedObjectContext.save()
            
        }catch{
            print(error)
        }
    }

}

