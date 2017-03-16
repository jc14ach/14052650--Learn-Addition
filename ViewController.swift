//
//  ViewController.swift
//  Kids Maths Game
//
//  Created by jc14ach on 21/02/2017.
//  Copyright © 2017 jc14ach. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
 
    var backgroundMusicPlayer = AVAudioPlayer()

    var firstNo: [Int] = [2,1,2,4,4,7]
    var secondNo: [Int] = [1,3,2,3,5,2]
    var awnser: [Int] = [3,4,4,7,9,9]
    var questionNo = 0
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star6: UIImageView!
    @IBOutlet weak var star7: UIImageView!
    @IBOutlet weak var star8: UIImageView!
    @IBAction func zero(sender: UIButton) {
        isCorrect(0)
      
    }
    
    @IBOutlet weak var wrongAnwser: UILabel!
    
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
        
        if (questionNo >= 6){ questionNo = 0}
        congratulationsView.hidden = true
        question1.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + " = "
        
    }
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var thumb: UIImageView!
    
    
    @IBOutlet weak var qMark: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        congratulationsView.hidden = true
        rotateStars()
        question1.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + "= "
        
        
        playBackgroundMusic("Mr Jelly Rolls.mp3")
        
    }

    
    
    func rotateStars() {
        
        
        
        UIView.animateWithDuration(1.5, delay: 0, options: .CurveLinear, animations: { () -> Void in
            
            
            
            self.star1.transform = CGAffineTransformRotate(self.star1.transform, CGFloat(M_PI_2))
            
            self.star2.transform = CGAffineTransformRotate(self.star2.transform, CGFloat(M_PI_2))
            
            self.star3.transform = CGAffineTransformRotate(self.star3.transform, CGFloat(M_PI_2))
            
            self.star4.transform = CGAffineTransformRotate(self.star4.transform, CGFloat(M_PI_2))
            
            self.star5.transform = CGAffineTransformRotate(self.star5.transform, CGFloat(M_PI_2))
            
            self.star6.transform = CGAffineTransformRotate(self.star6.transform, CGFloat(M_PI_2))
            
            self.star7.transform = CGAffineTransformRotate(self.star7.transform, CGFloat(M_PI_2))
            
            self.star8.transform = CGAffineTransformRotate(self.star8.transform, CGFloat(M_PI_2))
            
        }) { (finished) -> Void in
            
            self.rotateStars()
            
        }
        
    }
    
    
    func isCorrect(ans: Int){
        if ans == awnser[questionNo] {
            congratulationsView.hidden = false
            answerLabel.text = String(firstNo[questionNo]) + " + " + String(secondNo[questionNo]) + " = " + String(awnser[questionNo])
            questionNo = questionNo + 1
            
            bounceThumb()
        }
            
            
            
        else {
            
            wrongAns()
        }
    }
    
    
    
        
    
    
    // thumb image bounce animation
    
    func bounceThumb() {
        
        
        
        self.thumb.center.y = self.congratulationsView.bounds.midY + 90
        
        
        
        UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 20, options: [], animations: {
            
            
            self.thumb.center.y = self.congratulationsView.bounds.midY - 20
            
            
            
            }, completion: nil)
        
    }
    
    // flash question mark and make it red when wrong answer is selected
    
    func wrongAns() {
        
        self.qMark.textColor = UIColor.redColor()
        
        UIView.animateWithDuration(0.3, animations: {() -> Void in
            
            self.qMark.alpha = 0.0
            
            },
                                   
                                   completion: { finished in
                                    
                                    UIView.animateWithDuration(0.3, animations: {
                                        
                                        self.qMark.alpha = 1.0
                                        
                                        self.qMark.textColor = UIColor.blackColor()
                                        
                                    })
                                    
        })
        
        self.qMark.textColor = UIColor.redColor()
        
    }
    
    
    func playBackgroundMusic(filename: String) {
        
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        
        guard let newURL = url else {
            
            print("Could not find file: \(filename)")
            
            return
            
        }
        
        do {
            
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            
            backgroundMusicPlayer.numberOfLoops = -1
            
            backgroundMusicPlayer.prepareToPlay()
            
            backgroundMusicPlayer.play()
            
        } catch let error as NSError {
            
            print(error.description)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

