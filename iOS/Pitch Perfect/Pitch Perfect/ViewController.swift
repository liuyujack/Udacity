//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Yu Liu on 04/01/2016.
//  Copyright © 2016 Yu Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func RecordButton(sender: UIButton) {
        //TODO:show text and record.
        print("In recording")
        RecordingLabel.hidden = false
    }
    
    @IBAction func StopRecording(sender: UIButton) {
        RecordingLabel.hidden = true
    }
}

