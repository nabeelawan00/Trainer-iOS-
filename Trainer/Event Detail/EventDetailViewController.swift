//
//  EventDetailViewController.swift
//  Trainer
//
//  Created by Bills Mac on 09/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBOutlet weak var btnTrainerProfile: UIButton!
    @IBOutlet weak var btnContact: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTrainerProfile(_ sender: Any) {
    }
    
    @IBAction func btnContact(_ sender: UIButton) {
        
        let  vc = (storyboard?.instantiateViewController(withIdentifier:StoryBoardIds.SendMessageStoryboardID.rawValue))!
        self.navigationController?.pushViewController(vc,animated:true)
        
        
        
    }
}
