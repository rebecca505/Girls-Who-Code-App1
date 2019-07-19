//
//  DailyActViewController.swift
//  Spark
//
//  Created by GWC on 7/16/19.
//  Copyright © 2019 Zaina Shaik, Rebecca Frey, Ruby Franco, Stephanie Ang. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class DailyActViewController: UIViewController {

    var fingerSnapEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var generatorLabel: UILabel!
    
    let environmentNumber: Int = Int.random(in: 0...46)
    var environmentList: [String] = ["avoid using plastic for a day",
                                     "ride a bike/take public transport",
                                     "turn off the lights",
                                     "clean up litter around the street",
                                     "take a five (5) min shower",
                                     "plant a tree/flower (save the bees)",
                                     "bring an insect or spider outside instead of killing it",
                                     "shop at a farmers market",
                                     "carpool",
                                     "get a glass/metal straw","Reuse plastic bags",
                                     "wash laundry with cold water",
                                     "avoid eating meat",
                                     "eat/shop local",
                                     "stop drinking dairy",
                                     "use less water",
                                     "use less paper",
                                     "use a refillable water bottle",
                                     "go vegan for a day",
                                     "buy a tote bag",
        "give a dollar to a charity or a homeless person",
        "give away an old item of clothing",
        "when in line pay for the person behind you :)",
        "smile to a stranger",
        "give someone a compliment",
        "give your boss or teacher a compliment",
        "give your mom a compliment",
        "give your dad a compliment",
        "give your sibling a compliment",
        "give a friend a compliment",
        "give a coworker or classmate a compliment",
        "bake something for someone",
        "buy a gift for someone",
        "volunteer at a soup kitchen",
        "give a generous tip to a waiter",
        "give a hug to a loved one",
        "thank someone for what they’ve done for you",
        "use a face mask",
        "take a bath with a bath bomb",
        "not use your phone for a day",
        "throw out old stuff",
        "try to get an extra hour of sleep",
        "meditate",
        "read a book",
        "go on a jog",
        "go to a pet cafe",
        "treat yourself",
        "talk with a real person, face-to-face",
        "find a new hobby"]
    
   
    

    
    func setRandomItem0() {
        guard let item = environmentList.randomElement() else { return }
        generatorLabel.text = "Today you should: \(item)!"
    }
    
    func playSnap(){
        let path = Bundle.main.path(forResource: "Finger Snap.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do{
            fingerSnapEffect = try AVAudioPlayer( contentsOf: url)
            fingerSnapEffect?.play()
        }catch{
            print("couldn't load file")
        }
    }
    
    @IBAction func environmentButton(_ sender: Any) {
        setRandomItem0()
        playSnap()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
