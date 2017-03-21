//
//  DoneDelegate.swift
//  crud
//
//  Created by James Ye on 3/20/17.
//  Copyright © 2017 James Ye. All rights reserved.
//

import Foundation
import UIKit

protocol DoneDelegate: class {
    func doneButtonPressed(controller:UIViewController, text: String)
    
    func doneButtonPressedWithEdit(controller:UIViewController, text: String, index: Int)
} 
