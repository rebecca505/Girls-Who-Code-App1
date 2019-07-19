//
//  HomeViewController.swift
//  Spark
//
//  Created by GWC on 7/16/19.
//  Copyright © 2019 Zaina Shaik, Rebecca Frey, Ruby Franco, Stephanie Ang. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func notificationButton(_ sender: Any) {
        registerLocal()
    }
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("Aw...")
            }
        }
        
        registerCategories()
        
        //let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Daily Task Reminder"
        content.body = "Don't forget to do your daily task!"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        dateComponents.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        print("sched")
        
        let cont = UNMutableNotificationContent()
        cont.title = "Did you finish your daily task?"
        cont.body = "Don't forget to complete it!"
        cont.categoryIdentifier = "alarm"
        cont.userInfo = ["customData": "fizzbuzz"]
        cont.sound = UNNotificationSound.default
        
        var dailyComponents = DateComponents()
        dailyComponents.hour = 16
        dailyComponents.minute = 00
        let trig = UNCalendarNotificationTrigger(dateMatching: dailyComponents, repeats: true)
        
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: cont, trigger: trig)
        center.add(req)
        
    }
    
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more…", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // pull out the buried userInfo dictionary
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier")
                
            case "show":
                // the user tapped our "show more info…" button
                print("Show more information…")
                
            default:
                break
            }
        }
        
        // you must call the completion handler when you're done
        completionHandler()
    }
}

 
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


