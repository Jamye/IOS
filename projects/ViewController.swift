//
//  ViewController.swift
//  ninjaGold
//
//  Created by James Ye on 3/9/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func buildingButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            

            let randFarmNum = Int(arc4random_uniform(UInt32(15)+1))
            let farmString = String(randFarmNum)
            
            farmGoldLabel.text = "You made \(farmString) Gold"
            farmGoldLabel.isHidden = false
            
//            if farmGoldLabel.isHidden == false{
//            }
//            } else {
//                farmGoldLabel.isHidden = false
//            }
            farmGoldLabel.backgroundColor = UIColor.red
            
            print("farm pressed", farmString)
            
            
        case 2:

            let randCaveNum = Int(arc4random_uniform(UInt32(15)+1))
            let caveString = String(randCaveNum)
    
            caveGoldLabel.text = "You made \(caveString) Gold"

            farmGoldLabel.isHidden = true
            houseGoldLabel.isHidden = true
            if caveGoldLabel.isHidden == true{

                caveGoldLabel.isHidden = false
                caveGoldLabel.text = "You made \(caveString) Gold"
            }
//            } else if caveGoldLabel.isHidden == false {
//                caveGoldLabel.isHidden = true
//                }
            
            print("cave pressed")
    
        case 3:
            print("house pressed")
        case 4:
            print("casino pressed")
        case 5:
            print("reset")
        default:
            print("default")
            
        }
    }
    

    
    
    @IBOutlet weak var topScoreLabel: UILabel!
    
    @IBOutlet weak var farmGoldLabel: UILabel!

    @IBOutlet weak var caveGoldLabel: UILabel!
    
    @IBOutlet weak var houseGoldLabel: UILabel!
    @IBOutlet weak var casinoGoldLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//create the layout
    //all the buttons.
    //all the labels.
    //score on top
    //reset on bottom

//function for the clicks can be handled all by one action
    //assign tags to each click to make them have different functions
    //random arc for each
    //is hidden is true until click where ishidden label is false
    //label takes print you got \(randInt) gold
    
