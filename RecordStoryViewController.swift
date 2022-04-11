//
//  RecordStoryViewController.swift
//  MC3
//
//  Created by Latifah Almutairi on 28/07/1443 AH.
//

import UIKit
import AVFoundation

class RecordStoryViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    
    
    @IBOutlet weak var textStoryName: UITextField!
    
    
    
    
    @IBOutlet weak var recordBTN: UIButton!
    
    @IBOutlet weak var playBTN: UIButton!
    
    var soundRecord : AVAudioRecorder!
    
    var soundPlayer : AVAudioPlayer!
    
    var fileName : String = "audioFile.m4a"
    
 
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecorder()
        playBTN.isEnabled = false

    }
  
    func getDocumentsDirector() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func setupRecorder(){
        let audioFilename = getDocumentsDirector().appendingPathComponent(fileName)
        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless ,
                   AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                        AVEncoderBitRateKey : 320000,
                      AVNumberOfChannelsKey : 2 , AVSampleRateKey: 44100.2 ] as [String : Any]
        do {
            soundRecord = try AVAudioRecorder(url: audioFilename, settings: recordSetting)
            soundRecord.delegate = self
            soundRecord.prepareToRecord()
            
        } catch {
            print(error)
        }
        
    }
    
    func setupPlayer(){
        let audioFilename = getDocumentsDirector().appendingPathComponent(fileName)
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
            
            
            
            
        } catch {
            print(error)
        }
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playBTN.isEnabled = true
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBTN.isEnabled = true
        playBTN.setTitle("Play", for: .normal)
        
        
    }

    
    
    @IBAction func recordACt(_ sender: Any) {
        if recordBTN.titleLabel?.text == "Record"{
            soundRecord.record()
            recordBTN.setTitle("Stop", for: .normal)
            playBTN.isEnabled = false
            
        }else{
            
            soundRecord.stop()
            recordBTN.setTitle("Record", for: .normal)
            playBTN.isEnabled = false
            
        }
    }
    
    
    @IBAction func playAct(_ sender: Any) {
        if playBTN.titleLabel?.text == "Play"{
            
            playBTN.setTitle("Stop", for: .normal)
            
            recordBTN.isEnabled = false
            setupPlayer()
            soundPlayer.play()
            
        }else{
            
            
    
            //soundPlayer.stop()
            playBTN.setTitle("Play", for: .normal)
            recordBTN.isEnabled = false
            
        }
    }
    
    
    @IBAction func sendRecord(_ sender: Any) {
        
        var vc = storyboard?.instantiateViewController(withIdentifier: "StoryPageViewController") as? StoryPageViewController
     
//            let recordedAudioURL = sender as! URL
//        
//        vc?.receivedAudio = recordedAudioURL
        

            
            
        vc!.stories.append(Story(name: "Mama", imageHeadPhone: UIImage(systemName: "beats.headphones")!, imageName: UIImage(named: "AliceInWonderLand")!, trackName: fileName, color: UIColor(named: "MedPink")!))
            
            //vc!.navigationController?.pushViewController(vc!, animated: true)
        self.navigationController?.present(vc!, animated: true, completion: nil)
            

    }
    
}
