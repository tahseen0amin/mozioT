//
//  CurrentMedTest.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class CurrentMedTest: MedTest {
    
    var totalValue : Int = 0
    
    init(medTest:MedTest){
        super.init(dict: [:])
        self.title = medTest.title
        self.questions = medTest.questions
        self.results = medTest.results
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
