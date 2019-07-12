//
//  ResultsController.swift
//  FRIENDS Quiz
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    var numberCorrect: Int = 0
    var total: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsLabel.text = "You got \(numberCorrect) out of \(total)"
        
        let percentageRight = (Double(numberCorrect)/Double(total)) * 100
        var  title = ""
        
        if percentageRight < 40 {
            title = "That was no good 😩"
        } else if percentageRight < 75 {
            title = "Not bad 😕"
        } else {
            title = "Great job! 🤩"
        }
        
        titleLabel.text = title
        
        
    }
    
}
