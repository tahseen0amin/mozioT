//
//  Result.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class Result: BaseModel {
    
    var value : Int!
    var body : String!
    
    override init(dict:Dictionary<String,AnyObject>) {
        super.init(dict: dict)
        self.updateData(dict)
    }
    
    override func updateData(dict:Dictionary<String,AnyObject>) {
        if let val = dict[k_value] {
            self.value = val as! Int
        }
        if let val = dict[k_body] {
            self.body = val as! String
        }
        super.updateData(dict)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
