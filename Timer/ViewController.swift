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
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが実行中なら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
        
        // 画面遷移をおこなう
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが実行中ならスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerInterrupt(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        // タイマーをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが実行中だったら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
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
    
    // 経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        // countに+1していく
        count += 1
        // remainCountが0以下のときタイマーを止める
        if displayUpdate() <= 0 {
            // 初期化処理
            count = 0
            // タイマー停止
            timer.invalidate()
        }
    }
    
    // 画面切り替えのタイミングで更新をおこなう
    override func viewDidAppear(_ animated: Bool) {
        // カウント（経過時間）をゼロにする
        count = 0
        // タイマーの表示を更新する
        _ = displayUpdate()
    }
}

