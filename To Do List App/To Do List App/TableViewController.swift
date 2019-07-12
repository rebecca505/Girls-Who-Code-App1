//
//  TableViewController.swift
//  To Do List App
//
//  Created by GWC on 7/11/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//
import CoreData
import UIKit

class TableViewController: UITableViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [Task] = []
    
    func getData(){
        do {
            tasks = try context.fetch(Task.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print ("Xcode is broken, could not get data")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //func addNewTask() {}
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].taskName
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = self.tasks[indexPath.row]
            self.context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.tasks.remove(at: indexPath.row)
            // Update the line below so that it matches the name of your
            // table view's IBOutlet variable name
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
