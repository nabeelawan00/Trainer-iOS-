//
//  ThankuViewController.swift
//  Trainer
//
//  Created by Bills Mac on 22/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

class ThankuViewController: UIViewController {
    
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
        
        self.navigationController?.navigationBar.isHidden = true
        
    }

    @IBAction func actionThankYou(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
}
