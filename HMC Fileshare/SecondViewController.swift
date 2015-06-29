//
//  SecondViewController.swift
//  HMC Fileshare
//
//  Created by Eyassu Shimelis on 6/25/15.
//  Copyright (c) 2015 HMC Summer Startup. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var userLat: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println()
        println("Second View Controller Test:")
        println("Latitude: \(userLat)")
        println()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

