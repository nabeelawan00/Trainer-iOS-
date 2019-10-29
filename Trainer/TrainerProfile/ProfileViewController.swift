//
//  ProfileViewController.swift
//  Trainer
//
//  Created by Bills Mac on 23/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    /*
       // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
       }
       */

    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2

       
    }

}
