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
}

