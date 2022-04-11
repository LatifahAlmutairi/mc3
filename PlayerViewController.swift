//
//  PlayerViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 29/07/1443 AH.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var stories: [Story] = []
    
    @IBOutlet var theholder: UIView!
    var player: AVAudioPlayer?
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let StoryNmaeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(32)
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  theholder.backgroundColor = .red
        configure()
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        if theholder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure(){
        //setup player
        let story = stories[position]

        
        //setup userinterface elements
        //labels
        StoryNmaeLabel.frame = CGRect(x: 10, y: theholder.frame.size.height-250, width: theholder.frame.size.width-20, height: 30)
        
        StoryNmaeLabel.text = story.name
        theholder.addSubview(StoryNmaeLabel)
        
        //AlbimImage
        albumImageView.frame = CGRect(x: 10, y: -100, width: theholder.frame.size.width-20, height: theholder.frame.size.height-20)
        albumImageView.image = UIImage(named: "AliceInWonderLand")
        theholder.addSubview(albumImageView)
        
       
        
        
        
        
        
        //player controls
        
        //player controls
        
        //frame
        let yposition = StoryNmaeLabel.frame.origin.y + 10 + 70
        
        let size: CGFloat = 50
        
        playPauseButton.frame = CGRect(x: (theholder.frame.size.width - size ) / 2.0 , y: yposition, width: size, height: size)

        //Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPLayPauseButton), for: .touchUpInside)
        //Styling
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        theholder.addSubview(playPauseButton)
        
        playPauseButton.tintColor = .black
        
        //slider
        let slider = UISlider(frame: CGRect(x: 20, y: theholder.frame.size.height-60, width: theholder.frame.size.width-40, height: 50))
        
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        theholder.addSubview(slider)
        
        
        
        let urlString = Bundle.main.path(forResource: story.trackName, ofType: "mp3")
        
        do {
            
           try AVAudioSession.sharedInstance().setMode( .default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                print("\n\n\n\n\nurlString Error\n\n\n\n")
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("\n\n\n\n\nplayer\n\n\n\n")
                return
            }
            player.volume = 0.5
            
            player.play()
        }
        catch {
            print("\n\n\n\n\(error)\n\n\n\n\n")
        }

        
    }
    
    @objc func didTapPLayPauseButton(){
        if player?.isPlaying == true{
            //pause
            player?.pause()
            //show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

            
        } else {
            //play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    
    @objc func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        player?.volume = value
        //adjust volume
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}

