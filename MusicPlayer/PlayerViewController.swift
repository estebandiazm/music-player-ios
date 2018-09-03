//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Juan Diaz on 27/08/18.
//  Copyright © 2018 Juan Diaz. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    private var reproductor : AVAudioPlayer!
    var songName = ""
    var songExt = ""
    var imageName = ""
    var imageExt = ""
    
    @IBOutlet weak var volumenSlider: UISlider!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: imageName)
        
        
        let songPath = Bundle.main.path(forResource: songName, ofType: songExt)
        let url = URL(fileURLWithPath: songPath!)
        
        do {
            try reproductor = AVAudioPlayer(contentsOf: url)
            reproductor.play()
        } catch {
            print("Error song")
        }
        
        volumenSlider.value = reproductor.volume
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func stop() {
        if reproductor.isPlaying {
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    @IBAction func pause() {
        if reproductor.isPlaying {
            reproductor.pause()
        }
    }
    @IBAction func play() {
        if !reproductor.isPlaying {
            reproductor.play()
        }
        
    }
    @IBAction func volumenAction(_ sender: UISlider) {
        print(String(sender.value))
        reproductor.setVolume(sender.value, fadeDuration: 0)
    }
    
}
