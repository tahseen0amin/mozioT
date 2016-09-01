//
//  Response.swift
//  CC Organizer
//
//  Created by Tasin Zarkoob on 02/07/16.
//  Copyright © 2016 CrewCross. All rights reserved.
//

import UIKit

class Response: NSObject {
    
    var isSuccess : Bool = false
    var statusCode : Int = 500
    var message : String!
    var timestamp : NSTimeInterval!
    var data : Dictionary<String, AnyObject>!
    
    
    var parsedObject : NSDictionary!
    
    func parseResponse(data:NSData, response:NSHTTPURLResponse) {
        let any : AnyObject!
        do {
            any = try NSJSONSerialization.JSONObjectWithData(data,
                                                             options: .AllowFragments)
            self.parsedObject = any as? NSDictionary
            
            print("Response: \(self.parsedObject)")
            
            self.data = self.parsedObject["data"] as? Dictionary<String, AnyObject>
            
            if let success = parsedObject[k_status] as? Bool {
                isSuccess = success
            }
            
            
            message = parsedObject[k_message] as? String
            statusCode = response.statusCode
            timestamp = parsedObject["timestamp"] as? NSTimeInterval
        } catch _ {
            parsedObject = nil
            
        }
    }
}