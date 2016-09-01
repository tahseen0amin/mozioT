//
//  Request.swift
//  CC Organizer
//
//  Created by Tasin Zarkoob on 02/07/16.
//  Copyright © 2016 CrewCross. All rights reserved.
//

import UIKit

/**
 Base request class acctording to api structure Override for customizing the request.
 
 - apiEndPoint: query part of url
 */
class Request: NSMutableURLRequest {
    
    var apiEndPoint : String = ""
    var param : NSMutableDictionary = [:]
    
    // initalizing
    convenience init(endpoint:String,httpMethod:String) {
        self.init()
        self.apiEndPoint = endpoint
        self.HTTPMethod = httpMethod
    }
    
    func getResponseObject() -> Response {
        return Response()
    }
    
    /**
     creating actual post body and url here, override this method to customize the post body.
     Call super.completeBody in the last of the method
     */
    func completeBody() {
        
        // setup Header
        self.setValue("application/json",forHTTPHeaderField: "content-type")
        self.setValue("iOS",forHTTPHeaderField: "x-client-type")
        self.setValue(NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String,forHTTPHeaderField: "x-client-version")
        self.URL = NSURL.init(string: String.init(format: "%@%@", APP_BASE_URL,self.apiEndPoint))
        
        if HTTPMethod == "POST" || HTTPMethod == "PUT" {
            do {
                self.HTTPBody = try NSJSONSerialization.dataWithJSONObject(self.param,options: .PrettyPrinted)
            } catch _ {
                print("Error in request parameters for POST")
            }
        } // --- creating body
    }
}
