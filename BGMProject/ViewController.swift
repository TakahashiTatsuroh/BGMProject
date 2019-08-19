//
//  ViewController.swift
//  BGMProject
//
//  Created by 高橋達朗 on 2019/08/19.
//  Copyright © 2019 高橋達朗. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

//    カセットデッキ的な
    var player: AVAudioPlayer!
    
    var isPlaying = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        再生する音楽ファイルパス作成
//        forResource:ファイルの名前
//        ofType：ファイルの形成
        let audioPath = Bundle.main.path(forResource: "bgm1", ofType: "mp3")!
        
        let audioUrl = URL(fileURLWithPath: audioPath)
//        音楽ファイルを元に、プレイヤー作成
//        エラーが発生しうるコード
        do {
            player = try AVAudioPlayer(contentsOf: audioUrl)
//            無限ループ
            player.numberOfLoops = -1
        } catch let error {
            print(error.localizedDescription)
        }
        
//        再生
        player.delegate = self //おまじない
        player.prepareToPlay() //再生準備
        player.play() //再生
    }

    @IBAction func stopM(_ sender: UIButton) {
        
        
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    
}

