//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Yu Liu on 12/01/2016.
//  Copyright © 2016 Yu Liu. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: filePathUrl)
                audioPlayer.enableRate = true
            } catch is NSError {
                print("ERROR!")
            }

            
            
        }
        else {
            print ("Wrong Path")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PlaySlowAudio(sender: UIButton) {
        playAudio(0.5)
    }
    
    @IBAction func PlayFastAudio(sender: UIButton) {
        playAudio(2.0)
    }
    
    @IBAction func StopPlayingAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    
    func playAudio(Rate: Float)
    {
        audioPlayer.stop()
        audioPlayer.rate = Rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
