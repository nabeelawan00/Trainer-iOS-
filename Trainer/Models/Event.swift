//
//  File.swift
//  Trainer
//
//  Created by Bills Mac on 25/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import Foundation

struct RootEvent : Codable {
    
    let Eventdata : [Event]?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case Eventdata = "data"
        case status = "status"
    }
    
}

struct Event : Codable {
    
    let date_month: String?
    let coach_repeatedstarttime: String?
    let coach_repeatedendtime: String?
    let repeated_description: String?
    let repeated_fitness_studio: String?
    let repeated_area: String?
    let repeated_exact_description: String?
    let repeated_times: String?
    let repeated_weeks: String?
    let repeated_week_date: String?
    let repeated_space_customer: String?
    let repeated_training_unit: String?
    let coach_id: Int = -1
    let event_id: Int = -1
    let event_datetime: String?
    let coach_email: String = ""
    let coach_password: String?
    let coach_surname: String?
    let coach_name: String?
    let coach_lastname: String?
    let coach_photo: String?
    let coach_no_of_member: String?
    let coach_fitnessstudio: String?
    let coach_trainingday: String?
    let coach_gymmembership: String?
    let coach_short_description: String?
    let coach_experience_year: String?
    let coach_trainer_unit: String?
    let coach_address: String?
    let coach_repeatedweek: String?
    let coach_trainer_description: String?
    let coach_training_start_time: String?
    let coach_training_end_time: String?
    let coach_email_user: String?
    let coach_residentialarea: String?
    let coach_repeatedtitle: String?
    let coach_repeatedevent: String?
    let coach_status: String?
    let last_login: String?
    let admin_id: Int = -1
    let datetime: String?
    let coach_zipcode: String?
    let coach_country: String?
    
    enum CodingKeys: String, CodingKey {
        
        case date_month = "date_month"
        case coach_repeatedstarttime = "coach_repeatedstarttime"
        case coach_repeatedendtime = "coach_repeatedendtime"
        case repeated_description = "repeated_description"
        case repeated_fitness_studio = "repeated_fitness_studio"
        case repeated_area = "repeated_area"
        case repeated_exact_description = "repeated_exact_description"
        case repeated_times = "repeated_times"
        case repeated_weeks = "repeated_weeks"
        case repeated_week_date = "repeated_week_date"
        case repeated_space_customer = "repeated_space_customer"
        case repeated_training_unit = "repeated_training_unit"
        case coach_id = "coach_id"
        case event_id =  "event_id"
        case event_datetime = "event_datetime"
        case coach_email = "coach_email"
        case coach_password =  "coach_password"
        case coach_surname = "coach_surname"
        case coach_name = "coach_name"
        case coach_lastname = "coach_lastname"
        case coach_photo = "coach_photo"
        case coach_no_of_member =  "coach_no_of_member"
        case coach_fitnessstudio =  "coach_fitnessstudio"
        case coach_trainingday = "coach_trainingday"
        case coach_gymmembership = "coach_gymmembership"
        case coach_short_description = "coach_short_description"
        case coach_experience_year =  "coach_experience_year"
        case coach_trainer_unit = "coach_trainer_unit"
        case coach_address = "coach_address"
        case coach_repeatedweek =  "coach_repeatedweek"
        case coach_trainer_description = "coach_trainer_description"
        case coach_training_start_time = "coach_training_start_time"
        case coach_training_end_time =  "coach_training_end_time"
        case coach_email_user =  "coach_email_user"
        case coach_residentialarea =  "coach_residentialarea"
        case coach_repeatedtitle = "coach_repeatedtitle"
        case coach_repeatedevent =  "coach_repeatedevent"
        case coach_status =  "coach_status"
        case last_login =  "last_login"
        case admin_id =  "admin_id"
        case datetime =  "datetime"
        case coach_zipcode =  "coach_zipcode"
        case coach_country =  "coach_country"
        
    }
}
