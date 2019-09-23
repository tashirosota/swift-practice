//
//  EffectViewController.swift
//  App6
//
//  Created by 田代創大 on 2019/09/23.
//  Copyright © 2019 田代創大. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        effectImage.image = originalImage
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
    
    @IBOutlet weak var effectImage: UIImageView!
    
    let filterArray = [
        "CIPhotoEffectMono",
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CIPhotoEffectTone"
    ]
    
    var filterSelectNumber = 0
    
    var originalImage : UIImage?

    @IBAction func effectButton(_ sender: Any) {
        if let image = originalImage {
            let filterName = filterArray[filterSelectNumber]
            let rotate = image.imageOrientation
            let inputImage = CIImage(image: image)
            
            guard let effectFilter = CIFilter(name: filterName) else { return }
            
            effectFilter.setDefaults()
            
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
            guard let outputImage = effectFilter.outputImage else { return }
            
            let ciContext = CIContext(options: nil)
            
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else { return }
            
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
            
            
            filterSelectNumber += 1
            if filterSelectNumber == filterArray.count {
                filterSelectNumber = 0
            }
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        if let shareImage = effectImage.image {
            let shareItems = [shareImage]
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
