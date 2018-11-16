//
//  ViewController.swift
//  Timer
//
//  Created by Yusuke Nakane on 2018/11/15.
//  Copyright © 2018 usayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // タイマーの変数を作成
    var timer: Timer?
    // カウント（経過時間）の変数を作成
    var count = 0
    // 設定値を扱うキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        // UserDefaultsに初期値を設定
        settings.register(defaults: [settingKey: 10])
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: UIBarButtonItem) {
    }
    @IBAction func startButtonAction(_ sender: UIButton) {
    }
    @IBAction func stopButtonAction(_ sender: UIButton) {
    }
    
    // 画面の更新をする処理
    func displayUpdate() -> Int {
        // UserDefaultsインスタンスを生成
        let settings = UserDefaults.standard
        // 取得した秒数をtimerValueにわたす
        let timerValue = settings.integer(forKey: settingKey)
        // remainCount（残り時間）を生成
        let remainCount = timerValue - count
        // remainCount（残り時間）をラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        // 残り時間を戻り値に設定
        return remainCount
    }
}

