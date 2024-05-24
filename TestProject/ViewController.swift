//
//  ViewController.swift
//  TestProject
//
//  Created by Elena Vasilenko on 21/03/2024.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    
    private func findVideo()-> String?{
        guard let path = Bundle.main.path(forResource: "test", ofType: "mp4") else {
            debugPrint("test.mp4 not found")
            return nil
        }
        debugPrint("path is \(path)")
        return path
    }
    
    private func playVideo(){
        guard let path = findVideo() else {
            debugPrint("the video was not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true){
            player.play()
        }
    }
}

