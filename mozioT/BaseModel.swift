//
//  BaseModel.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class BaseModel: NSObject, NSCoding{
    
    var ID: Int!
    var title : String!
    
    init(dict:Dictionary<String,AnyObject>) {
        super.init()
    }
    
    func updateData(dict:Dictionary<String,AnyObject>) {
        if let val = dict[k_id] {
            self.ID = val as? Int
        }
        
        if let val = dict[k_title] {
            self.title = val as? String
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.ID, forKey: k_id)
    }
    
    required init?(coder aDecoder: NSCoder) {
        ID = aDecoder.decodeObjectForKey(k_id) as? Int
        title = aDecoder.decodeObjectForKey(k_title) as? String
        super.init()
    }
    
}
