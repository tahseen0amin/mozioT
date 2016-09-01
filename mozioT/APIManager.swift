//
//  APIManager.swift
//  CC Organizer
//
//  Created by Tasin Zarkoob on 02/07/16.
//  Copyright © 2016 CrewCross. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    /**
     Sending request to server, it calls complete before sending to complete the body and url of the http request.
     - Parameter request : A Request object containing req information
     - parameter response : A Response object containing status, parsed response and reason string to shwoing the failure of the request
     */
    class func sendAPIRequest(request:Request,completion:(response:Response)->Void) {
        
        request.completeBody()
        request.timeoutInterval = 30
        request.cachePolicy = .ReloadIgnoringLocalCacheData;
        
        print("Request URL :\(request.URL)")
        print("Request Parameters :\(request.param)")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            let objRespnse = request.getResponseObject()
            
            
            // COMMENTING FOR USING THE LOCAL DATA
            
            //            let responseHTTP = response as? NSHTTPURLResponse
            //            print(String.init(data: data!, encoding: NSUTF8StringEncoding))
            //            if responseHTTP?.statusCode == 200 && data != nil{
            //                objRespnse.parseResponse(data!, response: responseHTTP!)
            //            } else if responseHTTP?.statusCode == 401 && data != nil{
            //                let any : AnyObject!
            //                do {
            //                    any = try NSJSONSerialization.JSONObjectWithData(data!,
            //                                                                     options: .AllowFragments)
            //                    let parsedObject = any as? NSDictionary
            //                    
            //                    objRespnse.message = parsedObject![k_message] as? String
            //                    
            //                } catch _ {
            //                    objRespnse.message = "Something went wrong, \nplease try again later"
            //                    
            //                }
            //            }
            //            else {
            //                objRespnse.message = "Something went wrong, \nplease try again later"
            //            }
            
            dispatch_async(dispatch_get_main_queue(), {
                completion(response: objRespnse)
            })
        }
        task.resume()
    }
}
