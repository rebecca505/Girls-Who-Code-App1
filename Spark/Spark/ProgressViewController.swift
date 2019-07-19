//
//  ProgressViewController.swift
//  Spark
//
//  Created by GWC on 7/16/19.
//  Copyright © 2019 Zaina Shaik, Rebecca Frey, Ruby Franco, Stephanie Ang. All rights reserved.
//

import UIKit
import CoreData

class ProgressViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var score: Int64 = 0
    let treeStage = ["treeStage1", "treeStage2", "treeStage3", "treeStage4", "treeStage5", "treeStage6", "treeStage7", "treeStage8", "treeStage9", "treeStage10", "treeStage11", "treeStage12", "treeStage13", "treeStage14", "treeStage15", "treeStage16", "treeStage17", "treeStage18", "treeStage19", "treeStage20"]
   // var numPoints = Points()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let context = appDelegate.persistentContainer.viewContext
        //let score = NSEntityDescription.entity(forEntityName: "Points", in: context)
        //let score = NSManagedObject(entity: score!, insertInto: context)
        //update score somehow
        //do {
            //try context.save()
       // } catch {
            //print("Failed saving")
      //  }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadScore()
        
    }
    
    func loadScore(){
        do{
            let scores = try context.fetch(Point.fetchRequest()) as [Point]
            score = scores.last?.value ?? 0
            scoreLabel.text = "score: \(score)"

            
        }catch{
            print("could not recieve score")
            score = 0
        }
        
        setTree()

    }
    
    func saveScore(_ value: Int64) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        context.delete(Point(context: context))
        
        delegate.saveContext()
        
        let newScore = Point(context: context)
        newScore.value = value
        
        delegate.saveContext()
    }
    
    func setTree() {
        
       
        
        switch score {
        case 0...4:
            mainImageView.image = UIImage(named: treeStage[0])
        case 5...9:
            mainImageView.image = UIImage(named: treeStage[1])
        case 10...14:
            mainImageView.image = UIImage(named: treeStage[2])
        case 15...19:
            mainImageView.image = UIImage(named: treeStage[3])
        case 20...24:
            mainImageView.image = UIImage(named: treeStage[4])
        case 25...29:
            mainImageView.image = UIImage(named: treeStage[5])
        case 30...34:
            mainImageView.image = UIImage(named: treeStage[6])
        case 35...39:
            mainImageView.image = UIImage(named: treeStage[7])
        case 40...44:
            mainImageView.image = UIImage(named: treeStage[8])
        case 45...49:
            mainImageView.image = UIImage(named: treeStage[9])
        case 50...54:
            mainImageView.image = UIImage(named: treeStage[10])
        case 55...59:
            mainImageView.image = UIImage(named: treeStage[11])
        case 60...64:
            mainImageView.image = UIImage(named: treeStage[12])
        case 65...69:
            mainImageView.image = UIImage(named: treeStage[13])
        case 70...74:
            mainImageView.image = UIImage(named: treeStage[14])
        case 75...79:
            mainImageView.image = UIImage(named: treeStage[15])
        case 80...84:
            mainImageView.image = UIImage(named: treeStage[16])
        case 85...89:
            mainImageView.image = UIImage(named: treeStage[17])
        case 90...94:
            mainImageView.image = UIImage(named: treeStage[18])
        case 95...99:
            mainImageView.image = UIImage(named: treeStage[19])
        case 100...1000:
            mainImageView.image = UIImage(named: treeStage[20])
        default:
            mainImageView.image = UIImage(named: treeStage[20])

            
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

    
    @IBAction func completionButton(_ sender: Any) {
        //score = score + 1
        //scoreLabel.text = "Score: \(score) !"
        score = score + 1
        
        saveScore(score)
        scoreLabel.text = "score: \(score)"
        setTree()
        
    }
}
