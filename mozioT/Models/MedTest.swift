//
//  MedTest.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class MedTest: BaseModel {
    
    var questions : Array<Question> = []
    var results : Array<Result> = []
    
    override init(dict:Dictionary<String,AnyObject>) {
        super.init(dict: dict)
        self.updateData(dict)
    }
    
    override func updateData(dict:Dictionary<String,AnyObject>) {
        if let val = dict[k_questions] {
            let array = val as? NSArray
            for dic in array! {
                let obj = Question.init(dict: dic as! Dictionary<String, AnyObject>)
                if obj.title != nil {
                    self.questions.append(obj)
                }
            }
        }
        
        if let val = dict[k_results] {
            let array = val as? NSArray
            for dic in array! {
                let obj = Result.init(dict: dic as! Dictionary<String, AnyObject>)
                if obj.title != nil {
                    self.results.append(obj)
                }
            }
        }
        
        super.updateData(dict)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
