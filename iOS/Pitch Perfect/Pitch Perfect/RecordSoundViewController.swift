//
//  RecordSoundViewController
//  Pitch Perfect
//
//  Created by Yu Liu on 04/01/2016.
//  Copyright © 2016 Yu Liu. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {

    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //Hide the stop button
        StopButton.hidden = true
    }


    @IBAction func RecordButton(sender: UIButton) {
        //TODO:show text and record.
        print("In recording")
        RecordingLabel.hidden = false
        StopButton.hidden = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true)[0] as String;
        
        //let currentDateTime = NSDate()
        //let formatter = NSDateFormatter()
        //formatter.dateFormat = "ddMMyyyy-HHmmss"
        //let RecordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let RecordingName = "my_audio.wav"
        let PathArray = [dirPath,RecordingName]
        let filePath = NSURL.fileURLWithPathComponents(PathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
    }
    
    @IBAction func StopRecording(sender: UIButton) {
        RecordingLabel.hidden = true
        StopButton.hidden = true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false);
    }
    
    func performSegue() {
        
    }
}

