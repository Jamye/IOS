//
//  ViewController.swift
//  crud
//
//  Created by James Ye on 3/20/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, CancelDelegate, DoneDelegate{

    var list = ["Vacation to Africa", "Swim with Turtles", "Eat BBQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell")!
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("delete item at index \(indexPath.row)")
        
        list.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    
    
    //protocol methods
    
    func cancelButtonPressed(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    //this fucntion adds new entries to the list
    func doneButtonPressed(controller: UIViewController, text: String) {
        list.append(text)
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    //this function modifies existing entries
    func doneButtonPressedWithEdit(controller: UIViewController, text: String, index: Int) {
        list[index] = text
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItem", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController                  //going from bucklisttableviewcontroller to the NavController
        let controller = nav.topViewController as! AddItemViewController        //going from NavController to the AddItemViewController
        
        controller.cancelDelegateVariable = self                                //went deep and got access to the attribute cancelDelgateVariable and set
                                                                                //that to self. And that SELF is  refering to this page,the bucketlisttableviewcontroller that conforms to the protocol CancelDelegate
        controller.doneDelegateVariable = self                       //you can use controller var for both because it connects the whole
                                                                                //navcontroller and the topView of the AddItemViewController.
        
        if segue.identifier == "editItem"{
            let indexPath = sender as! IndexPath
            
            controller.indexOfItemToEdit = indexPath.row
            controller.textOfItemToEdit = list[indexPath.row]
//            controller.
        }
        
    }
    
    
} 

