//
//  ChildrenPlayerStoryViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 05/08/1443 AH.
//

import UIKit
import AVFoundation


class ChildrenPlayerStoryViewController: UIViewController {
    
    
    public var positionChild: Int = 0
    public var stories: [StoryChild] = []
    
    

    @IBOutlet weak var theholderChild: UIView!
    var playerChild: AVAudioPlayer?
    
    
    
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
        configure()
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        
        if theholderChild.subviews.count == 0 {
            configure()
        }
    }
    
    func configure(){
        //setup player
        let story = stories[positionChild]

        
        //setup userinterface elements
        //labels
        StoryNmaeLabel.frame = CGRect(x: 10, y: theholderChild.frame.size.height-250, width: theholderChild.frame.size.width-20, height: 30)
        
        StoryNmaeLabel.text = story.name
        theholderChild.addSubview(StoryNmaeLabel)
        
        //AlbimImage
        albumImageView.frame = CGRect(x: 10, y: -100, width: theholderChild.frame.size.width-20, height: theholderChild.frame.size.height-20)
        albumImageView.image = UIImage(named: "AliceInWonderLand")
        theholderChild.addSubview(albumImageView)
    
    
        let yposition = StoryNmaeLabel.frame.origin.y + 10 + 70
        
        let size: CGFloat = 50
        
        playPauseButton.frame = CGRect(x: (theholderChild.frame.size.width - size ) / 2.0 , y: yposition, width: size, height: size)

        //Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPLayPauseButton), for: .touchUpInside)
        //Styling
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        theholderChild.addSubview(playPauseButton)
        
        playPauseButton.tintColor = .black
        
        //slider
        let slider = UISlider(frame: CGRect(x: 20, y: theholderChild.frame.size.height-60, width: theholderChild.frame.size.width-40, height: 50))
        
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        theholderChild.addSubview(slider)
    

        let urlString = Bundle.main.path(forResource: story.trackName, ofType: "mp3")
        
        do {
            
           try AVAudioSession.sharedInstance().setMode( .default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                print("\n\n\n\n\nurlString Error\n\n\n\n")
                return
            }
            playerChild = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = playerChild else {
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
        if playerChild?.isPlaying == true{
            //pause
            playerChild?.pause()
            //show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

            
        } else {
            //play
            playerChild?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    @objc func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        playerChild?.volume = value
        //adjust volume
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = playerChild {
            player.stop()
        }
    }
}

