//
//  TestRequest.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 02/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

enum RequestType {
    case ALL_TESTS
}
class TestRequest: Request {
    
    private var reqType:RequestType?
    
    // FOR LOCAL DATA 
    override func getResponseObject() -> Response {
        let resp = Response()
        switch self.reqType! {
        case RequestType.ALL_TESTS:
            let d = allTestJSON.dataUsingEncoding(NSUTF8StringEncoding)
            resp.parseResponse(d!, response: NSHTTPURLResponse())
            break
        }
        
        return resp
    }
    
    convenience init(options:RequestType) {
        self.init()
        self.reqType = options
    }
    
    override func completeBody() {
        
        switch self.reqType! {
        case RequestType.ALL_TESTS:
            //            self.HTTPMethod = "POST"
            //            self.apiEndPoint = ENDPOINT_ALLTEST
            break
        }
        super.completeBody()
    }
}
