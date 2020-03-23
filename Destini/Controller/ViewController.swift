//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    // Properties
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI()
        
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
        
    }
    
    @IBAction func restartPressed(_ sender: Any) {
     
        storyBrain.storyIndex = 0
        topButton.isHidden = false
        bottomButton.isHidden = false
        updateUI()
        
    }
    
    func updateUI() {
        
        if storyBrain.storyIndex != -1 {
            storyTextView.text = storyBrain.getStoryTitle()
            topButton.setTitle(storyBrain.getChoice1(), for: .normal)
            bottomButton.setTitle(storyBrain.getChoice2(), for: .normal)
        } else {
            storyTextView.text = "Thanks for playing! You have reached the end of your destiny. Press restart on the top left corner to reset your Destini!"
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        
    }
    
}

