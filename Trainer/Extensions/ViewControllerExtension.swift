//
//  ViewControllerExtension.swift
//  Trainer
//
//  Created by Bills Mac on 24/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

// MARK: - Navigation
extension UIViewController {
    
    /*
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    }
    */
    
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
    
    
    func showOneButtonAlertView(title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        //        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
}


