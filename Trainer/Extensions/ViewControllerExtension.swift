//
//  ViewControllerExtension.swift
//  Trainer
//
//  Created by Bills Mac on 24/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

// MARK: - Navigation
extension UIViewController {
    
    func addNavBarImage() {
        
        let navController = self.navigationController
        
        let image = UIImage(named: "logo") //Your logo url here
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController?.navigationBar.frame.size.width
        let bannerHeight = navController?.navigationBar.frame.size.height
        
        let bannerX = bannerWidth! / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight! / 2 - (image?.size.height)! / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth!, height: bannerHeight!)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
    func movetoNex(with identifier: String, classNmae: Any)  {
        print("moveing to next screen")
    }
}

/*
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
