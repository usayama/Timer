//
//  SettingViewController.swift
//  Timer
//
//  Created by Yusuke Nakane on 2018/11/16.
//  Copyright © 2018 usayama. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: UIButton) {
        
    }
}
