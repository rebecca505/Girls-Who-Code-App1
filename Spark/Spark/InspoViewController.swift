//
//  InspoViewController.swift
//  Spark
//
//  Created by GWC on 7/16/19.
//  Copyright © 2019 Zaina Shaik, Rebecca Frey, Ruby Franco, Stephanie Ang. All rights reserved.
//

import UIKit

class InspoViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    
    let quoteNumber: Int = Int.random(in: 0...16)
    let quoteList: [String] = ["\"You must be the change you wish to see in the world.\" -Gandhi",
                               "\"Stand up to your obstacles and do something about them. You will find that they haven't half the strength you think they have.\" -Norman Vincent Peale",
                               "\"Change your life today. Don't gamble on the future, act now, without delay.\" -Simone de Beauvoir",
                               "\"It always seems impossible until it's done.\" -Nelson Mandela",
                               "\"If you judge people, you have no time to love them.\" -Mother Teresa",
                               "\"Get action. Seize the moment. Man was never intended to become an oyster.\" -Theodore Roosevelt",
                               "\"We are all in the gutter, but some of us are looking at the stars.\" -Oscar Wilde",
                               "\"Yesterday is history, tomorrow is a mystery, today is a gift of God, which is why we call it the present.\" -Bill Keane",
                               "\"It is never too late to be what you might have been.\" -George Eliot",
                               "\"You can never quit. Winners never quit, and quitters never win.\" -Ted Turner",
                               "\"Everything you can imagine is real.\" -Pablo Picasso",
                               "\"Do what you can, with what you have, where you are.\" -Theodore Roosevelt",
                               "\"When one door of happiness closes, another opens; but often we look so long at the closed door that we do not see the one which has been opened for us.\" -Helen Keller",
                               "\"Happiness is not something ready made.It comes from your own actions.\" -Dalai Lama XIV",
                               "\"Never doubt that a small group of thoughtful, committed, citizens can change the world. Indeed, it is the only thing that ever has.\" -Margaret Mead",
                               "\"Failure is impossible.\" -Susan B Anthony",
                               "\"Our lives begin to end the day we become silent about things that matter.\" -Martin Luther King Jr."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setRandomQuote() {
        guard let quote = quoteList.randomElement() else { return }
        quoteLabel.text = quote
    }
    
    @IBAction func quoteButton(_ sender: Any) {
        setRandomQuote()
    }
}

        // Do any additional setup after loading the view.

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


