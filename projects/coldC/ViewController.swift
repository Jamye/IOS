//
//  ViewController.swift
//  coldCall
//
//  Created by James Ye on 3/8/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nameBank = ["Jay", "Pat", "Kat", "Edd", "Bri", "Mich"]
    
    var currentName = 0
    
    @IBOutlet weak var switchNameLabel: UILabel!
    @IBOutlet weak var switchNumberLabel: UILabel!
    

    @IBAction func coldCallPressed(_ sender: UIButton) {
        print ("button was pushed")
        
        if currentName < nameBank.count - 1{
            currentName += 1
        } else {
            currentName = 0
        }
        randomName()
        randomNum()
    }
    
    func randomName() {
        let ind =  Int(arc4random_uniform(UInt32(5)+1))
        switchNameLabel.text = nameBank[ind]
    }
    
    func randomNum() {
        let randNum =  Int(arc4random_uniform(UInt32(5)+1))
        let showNum = String(randNum)
        switchNumberLabel.text = showNum
        
        if randNum <= 2 {
            switchNumberLabel.textColor = UIColor.red
        } else if randNum == 5 {
            switchNumberLabel.textColor = UIColor.blue
        } else {
            switchNumberLabel.textColor = UIColor.orange
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

