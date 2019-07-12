//
//  ViewController.swift
//  Photo App
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 Rebecca. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBAction func Sepia(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage (cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    @IBAction func Halftone(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(25, forKey: kCIInputWidthKey)
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage (cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    @IBAction func Noir(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CIPhotoEffectNoir")!
        let image = CIImage(image: myImageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage (cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale), orientation: .right)
        myImageView.image = newImage
    }
    
    
    var imagePickerController: UIImagePickerController!

    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       imagePickerController.dismiss(animated: true, completion: nil)
            imagePickerController.dismiss(animated: true, completion: nil)
            myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func saveImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        let image = myImageView.image!
        let imageData = image.pngData(); fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    

    
    @IBAction func handleTakePhoto(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func handleSavePhoto(_ sender: Any) {
        saveImage(imageName: "test.png")
        UIImageWriteToSavedPhotosAlbum(myImageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    

}

