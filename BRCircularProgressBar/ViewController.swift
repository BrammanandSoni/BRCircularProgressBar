//
//  ViewController.swift
//  BRCircularProgressBar
//
//  Created by Brammanand Soni on 3/29/17.
//  Copyright © 2017 Brammanand Soni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBarNIB: BRCircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showTimerProgressViaNIB()
        showTimerProgressViaInstance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private Methods
    
    func showTimerProgressViaNIB() {
        progressBarNIB.setCircleStrokeWidth(10)
        var second: CGFloat = 60
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (timer) in
            second -= 1
            self?.progressBarNIB.progress = second/60
            self?.progressBarNIB.setProgressText("\(second)")
            
            if second == 0 { // restart rotation
                second = 60
            }
        }
    }
    
    func showTimerProgressViaInstance() {
        
        let progressView = BRCircularProgressView(frame: CGRect(x: self.view.frame.size.width/2 - 25, y: progressBarNIB.frame.origin.y - 150, width: 50, height: 50))
        progressView.setCircleStrokeWidth(5)
        progressView.setCircleColor(UIColor.lightGray, circleBackgroundColor: UIColor.white, progressCircleColor: UIColor.blue, progressCircleBackgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
        
        let completeProgress: CGFloat = 100
        var progressCompleted: CGFloat = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            progressCompleted += 1
            progressView.progress = progressCompleted / completeProgress
            
            if progressCompleted == 100 {
               progressCompleted = 0
            }
        }
        
        self.view.addSubview(progressView)
    }
}

