//
//  ResultViewController.swift
//  kanjiGame
//
//  Created by 佐藤優衣 on 2016/07/19.
//  Copyright © 2016年 Yui Sato. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var total : Int = 0
    var correctAnswer : Int = 0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(total)
        resultLabel.text = String(correctAnswer)
        totalLabel.text = String(total)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
