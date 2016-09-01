//
//  Question.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class Question: BaseModel {
    
    var body : String!
    var options : Array<Option> = []
    
    
    override init(dict:Dictionary<String,AnyObject>) {
        super.init(dict: dict)
        self.updateData(dict)
    }
    
    override func updateData(dict:Dictionary<String,AnyObject>) {
        if let val = dict[k_options] {
            let array = val as? NSArray
            for optDic in array! {
                let opt = Option.init(dict: optDic as! Dictionary<String, AnyObject>)
                if opt.title != nil {
                    self.options.append(opt)
                }
            }
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
