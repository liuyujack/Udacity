//
//  RecordSoundViewController
//  Pitch Perfect
//
//  Created by Yu Liu on 04/01/2016.
//  Copyright © 2016 Yu Liu. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    var audioRecorder: AVAudioRecorder!
    var recordedAudio: RecordedAudio!
    
    func RecordSoundViewController(){
        
    }
    
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
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            audioRecorder = try AVAudioRecorder(URL: filePath!, settings: [:])
        } catch _{
            print("Failed")
        }
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        print (audioRecorder.prepareToRecord().description)
        audioRecorder.record()
        print(audioRecorder.recording.description)
      }
    
    @IBAction func StopRecording(sender: UIButton) {
        RecordingLabel.hidden = true
        StopButton.hidden = true
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag) {
            //Save the Audio
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = audioRecorder.url
            recordedAudio.title = audioRecorder.url.lastPathComponent
            //Perform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else{
            print("Recording failed, ", recorder.recording.description)
            recordButton.enabled = true
            StopButton.hidden = true
        }
        
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "StopRecording"){
            print("Yeah")
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
            }
    }
}

