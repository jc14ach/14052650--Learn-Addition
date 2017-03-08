//
//  ViewController.swift
//  Kids Maths Game
//
//  Created by jc14ach on 21/02/2017.
//  Copyright © 2017 jc14ach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let W = UIScreen.mainScreen().bounds.width
    let H = UIScreen.mainScreen().bounds.height
    
    

    var firstNo: [Int] = [2,1,2,4,4,7]
    var secondNo: [Int] = [1,3,2,3,5,2]
    var awnser: [Int] = [3,4,4,7,9,9]
    var questionNo = 0
    
    @IBAction func zero(sender: UIButton) {
        isCorrect(0)
    }
    
    @IBAction func one(sender: UIButton) {
        isCorrect(1)
    }

    @IBAction func two(sender: UIButton) {
        isCorrect(2)
    }
    @IBAction func three(sender: UIButton) {
        isCorrect(3)
    }
    @IBAction func four(sender: UIButton) {
        isCorrect(4)
    }
    @IBAction func five(sender: UIButton) {
        isCorrect(5)
    }
    
    @IBAction func six(sender: UIButton) {
        isCorrect(6)
    }
    
    @IBAction func seven(sender: UIButton) {
        isCorrect(7)
    }
    
    @IBAction func eight(sender: UIButton) {
        isCorrect(8)
    }
    
    @IBAction func nine(sender: UIButton) {
        isCorrect(9)
    }
    
    @IBOutlet weak var congratulationsView: UIView!
    
    @IBOutlet weak var question1: UILabel!
    
    @IBAction func replay(sender: UIButton) {
        
        congratulationsView.hidden = true
        question1.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + " = " + " ? "
        
    }
    @IBOutlet weak var answerLabel: UILabel!
    
    
    
    
    
    
    
    func isCorrect(ans: Int){
        if ans == awnser[questionNo] {
        congratulationsView.hidden = false
            answerLabel.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + " = " + String(awnser[questionNo])
            questionNo = questionNo + 1 }

        else {
                // make question mark red as its wrong
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        congratulationsView.hidden = true
        
        question1.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + "= ?"
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

