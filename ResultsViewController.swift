//
//  ResultsViewController.swift
//  WhichProgrammingLang
//
//  Created by Emily Roach on 5/29/18.
//  Copyright © 2018 Emily Roach. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    

    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var numJs: Int = 0
    var numSwift: Int = 0
    var numScratch: Int = 0
    var numHtml: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check results
        if(numJs > numSwift && numJs > numScratch && numJs > numHtml) {
            resultsLabel.text = "JavaScript"
            descLabel.text = "JavaScript is the language of video games and web pages because it is so interactive!"
        } else if(numSwift > numJs && numSwift > numScratch && numSwift > numHtml) {
            resultsLabel.text = "Swift"
            descLabel.text = "Swift is the language of iOS app development!"
        } else if(numScratch > numJs && numScratch > numSwift && numScratch > numHtml) {
            resultsLabel.text = "Scratch"
            descLabel.text = "Scratch is a block-based language that young programmers use to code games and animations"
        } else if(numHtml > numJs && numHtml > numSwift && numHtml > numScratch) {
            resultsLabel.text = "HTML"
            descLabel.text = "HTML is the language of the web! All of your favorite webpages use HTML for their layout and content."
        } else{
            resultsLabel.text = "You got a tie!"
            descLabel.text = "Try again and change one of your answers."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
