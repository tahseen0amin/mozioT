//
//  TestDetailTableController.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class TestDetailTableController: BaseViewController, UIScrollViewDelegate, QuestionViewDelegate {
    
    var medTest:CurrentMedTest!
    var currentQuestion = 0
    
    @IBOutlet weak var scrollView : UIScrollView!
    
    override func viewDidLoad() {
        self.setupNavigation()
        if self.medTest != nil {
            self.title = self.medTest.title
            self.setupScrollview()
        }
    }
    
    private func setupScrollview(){
        var originPoint:CGFloat = 0
        let screenWidth = CGRectGetWidth(self.view.bounds)
        let screenHeight = CGRectGetHeight(self.view.bounds)
        for question in self.medTest.questions {
            let queView = QuestionView()
            queView.question = question
            queView.delegate = self
            queView.frame = CGRect(x: originPoint, y: 0, width: screenWidth, height:screenHeight )
            queView.setNeedsDisplay()
            self.scrollView.addSubview(queView)
            originPoint = originPoint + screenWidth
        }
        self.scrollView.contentSize = CGSize(width: (screenWidth * CGFloat(self.medTest.questions.count)) , height: screenHeight)
        self.scrollView.scrollEnabled = false
    }
    
    func questionAnswered(value: Int) {
        self.medTest.totalValue += value
        self.nextQuestion()
    }
    
    private func nextQuestion() {
        self.currentQuestion += 1
        if self.currentQuestion < self.medTest.questions.count {
            let nextQuestionView = self.scrollView.subviews[currentQuestion]
            self.scrollView.scrollRectToVisible(nextQuestionView.frame, animated: true)
        } else {
            self.showResult()
        }
        
    }
    
    private func showResult(){
        let resultsController = MedicalTestResultController()
        resultsController.currentTest = self.medTest
        self.navigationController?.pushViewController(resultsController, animated: true)
    }
}
