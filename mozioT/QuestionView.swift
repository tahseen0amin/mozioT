//
//  QuestionView.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 02/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

protocol QuestionViewDelegate {
    func questionAnswered(value:Int)
}

class QuestionView: BaseView {
    
    @IBOutlet weak var lblQuestionBody: UILabel!
    @IBOutlet var btnOptions: [UIButton]!
    
    var delegate : QuestionViewDelegate!
    var question : Question! {
        didSet {
            self.setupView()
        }
    }
    
    func setupView() {
        self.lblQuestionBody.text = question.body
        var i = 0
        while i < btnOptions.count {
            let option = question.options[i]
            let btnOption = btnOptions[i]
            btnOption.setTitle(option.title, forState: .Normal)
            btnOption.tag = i
            i += 1
        }
    }
    
    @IBAction func optionClicked(sender: UIButton) {
        let option = question.options[sender.tag]
        self.delegate.questionAnswered(option.value!)
    }
}
