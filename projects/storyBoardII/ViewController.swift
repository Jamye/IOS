//
//  ViewController.swift
//  storyboardII
//
//  Created by James Ye on 3/8/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pageCount = 0
    
    var poem = ["I want to play my storyboards",
                "All over the Apple App Store",
                "And let my objects sing a song no one has heard before"]

    @IBOutlet weak var poemLabel: UILabel!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if pageCount < poem.count - 1 {
            pageCount += 1
        } else {
            pageCount = 0
        }
        poemLabel.text = poem[pageCount]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        poemLabel.text = poem[pageCount]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

