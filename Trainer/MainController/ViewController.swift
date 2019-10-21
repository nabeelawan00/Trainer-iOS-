//
//  ViewController.swift
//  Trainer
//
//  Created by Bills Mac on 23/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit

 // MARK: - NABEEL AWAN

class ViewController: UIViewController {

    @IBOutlet weak var btnLetsGo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       addNavBarImage()
        
    }
    
    @IBAction func movetoNextScrenn(_ sender: UIButton) {
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: StoryBoardIds.trainerLIstSID.rawValue))!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

