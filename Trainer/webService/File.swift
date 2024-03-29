//
//  File.swift
//  Trainer
//
//  Created by Bills Mac on 29/10/2019.
//  Copyright © 2019 Bills Mac. All rights reserved.
//

import Foundation
import Alamofire

typealias apiSuccess = (_ data: Data) -> ()
typealias apiFailure = (_ errorString: String) -> ()
typealias HTTPfailure = (_ errorString: String) -> ()
//Qazi Ammar Api typeAlies.
typealias successApi = (_ responseObject: Any) -> ()

class WebServices  {
    
    static let baseUrl = "http://www.mocky.io/v2/59bbc4640f00001102ff872f"
    static let trainerBaseURL = "http://trainer.elites.pk/trainerapi/api/"
    static let imageBaseURL = "http://trainer.elites.pk/"
    static let event = "event"
    
    static let headers = ["Accept": "application/json",
                  "ClientService": "trainer-client",
                  "AuthKey": "ItIsfoRSeCurty!@).(@"
    ]
    
    class func URLResponse(_ url:String, method: HTTPMethod ,parameters: [String: Any]?, withSuccess success: @escaping apiSuccess, withapiFiluer failure: @escaping apiFailure) {
        
        //  let completeUrl : String = baseUrl + url
        _ =  HTTPHeaders()
        
        Alamofire.request(url, method:method, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200..<600).responseData(completionHandler: { respones in
            switch respones.result {
            case .success(let value):
                
                success(value)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
        
    }
    
    class func callApiWith(url: URL, method: HTTPMethod, parameters: [String: Any]?, headers: [String: String],withSucces success: @escaping successApi,  withapiFiluer failure: @escaping apiFailure) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseJSON(completionHandler: {
            respones in
            switch respones.result {
            case .success(let responseObject):
                success(responseObject)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
        
    }
    
}
