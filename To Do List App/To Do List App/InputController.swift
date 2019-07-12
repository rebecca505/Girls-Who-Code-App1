//
//  ViewController.swift
//  To Do List App
//
//  Created by GWC on 7/11/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//

import CoreData
import UIKit

class InputController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputField.delegate = self
        
    }

    @IBAction func submitTask(_ sender: Any) {
        guard inputField.text != "" else { return }
        // this ^ doesn't let them put in an empty string
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let newTask = Task (context: context)
        newTask.taskName = inputField.text
        
        delegate.saveContext()
        
        inputField.text = ""
        view.endEditing(true)
        //this ^ lets you close out the keyboard
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        //this ^ lets you click "return" to close the keyboard
    }
}

