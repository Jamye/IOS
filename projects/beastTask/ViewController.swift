//
//  ViewController.swift
//  beastTaskList
//
//  Created by James Ye on 3/13/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var task = ["Jeff", "Celo", "Austin", "Jasper", "Vanessa", "Michelle", "Audrey", "Brice", "Lee", "Yah Yah"]


    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        print ("button pressed")
        let newText = taskTextField.text 
        task.append(newText!)
            tableView.reloadData()
            print(task)
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        let listItem = String(task[indexPath.row])
        cell.textLabel?.text = listItem!
        
        let age = arc4random_uniform(95-5) + 5
        cell.detailTextLabel?.text = "\(age) Years old"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        task.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    
}

