//
//  EventListViewController.swift
//  Trainer
//
//  Created by Bills Mac on 26/09/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import UIKit
import SDWebImage

class EventListViewController: UIViewController{
    
    var rootResponse: RootEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootResponse?.Eventdata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath) as! EventTableViewCell
        
        let event = rootResponse?.Eventdata?[indexPath.row]
        cell.eventName.text = event?.coach_name
        cell.eventClub.text = event?.coach_fitnessstudio
        cell.eventDayType.text = event?.coach_trainer_unit
        cell.eventStartEndTime.text = (event?.coach_training_end_time ?? "") + "  " + (event?.coach_training_start_time ?? "")
        
        let imageURL = URL(string: WebServices.imageBaseURL + (event?.coach_photo ?? ""))
        cell.eventImage.sd_setImage(with: imageURL, completed: nil)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: StoryBoardIds.EventDetailStoryboardID.rawValue) as! EventDetailViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
