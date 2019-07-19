//
//  InfoViewController.swift
//  Spark
//
//  Created by GWC on 7/16/19.
//  Copyright © 2019 Zaina Shaik, Rebecca Frey, Ruby Franco, Stephanie Ang. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    


    @IBAction func variousCharities(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.best-charities.org/home/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func handUp(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://handup.org/campaigns")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func wwf(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://support.worldwildlife.org/site/SPageServer?pagename=can_home&_ga=2.85163100.439512638.1563229139-571860689.1563229139")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func icc(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://oceanconservancy.org/trash-free-seas/international-coastal-cleanup/map/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func unionStation(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://unionstationhs.org/help/volunteer/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func hss(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.homelessshelterdirectory.org/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func fafb(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.feedingamerica.org/take-action")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func fpn(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.foodpantries.org/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func s4s(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://soles4souls.org/about-us/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func goodwill(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.goodwill.org/locator/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func whyWeDidThis(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://docs.google.com/document/d/1nkOaaGVlHL5JhaO10Aj3TEsoeT1SufYX9Iww3Tjyo30/edit?usp=sharing")! as URL, options: [:], completionHandler: nil)
    }
}
