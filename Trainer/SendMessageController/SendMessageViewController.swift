//
//  ProfileViewController.swift
//  Trainer
//
//  Created by Bills Mac on 21/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController {
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendEmail(_ sender: UIButton) {
        
        let  vc = (storyboard?.instantiateViewController(withIdentifier:StoryBoardIds.ThankuStoryboardID.rawValue))!
        self.present(vc, animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: false)
    }
    
}
