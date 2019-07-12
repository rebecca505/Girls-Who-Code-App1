//
//  GalleryViewController.swift
//  Photo App
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryImageView: UIImageView!
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath) {
        
        let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!,scale: (image?.scale)!,orientation: .right)
        galleryImageView.image = newImage
        } else {
            print ("No image!😩😢")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImage(imageName: "test.png")

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

}
