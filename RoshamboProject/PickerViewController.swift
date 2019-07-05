//
//  PickerViewController.swift
//  RoshamboProject
//
//  Created by mac on 03/07/2019.
//  Copyright © 2019 CBC GEDU. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

    @IBOutlet weak var buttonPaper: UIButton!
    @IBOutlet weak var buttonRock: UIButton!
    @IBOutlet weak var buttonScissor: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func makeMove(_ sender: UIButton) {
        
        // Here the RPS enum holds a player's move
        switch (sender) {
        case self.buttonPaper:
            play(RoshamboModel.paper)
            
        case self.buttonRock:
            play(RoshamboModel.rock)
            
        case self.buttonScissor:
            play(RoshamboModel.scissor)
        default:
            assert(false, "Invalid")
            
        }
    }
    
    //Player and Computer makes a move
    
    func play(_ playerMove: RoshamboModel)
    {
        // Computer makes a move
        let computersMove = RoshamboModel()
        
        // results of a match is stored
        self.match = ResultHistory(p1: playerMove, p2: computersMove)
        
        
        if (playerMove == RoshamboModel.paper) {
            // Get the storyboard and ResultViewController
            let storyboard = UIStoryboard (name: "PickerViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            // the result is passed accross
            controller.match = self.match
            self.present(controller, animated: true, completion: nil)
        }
            
        else if (playerMove == RoshamboModel.rock) {
            performSegue(withIdentifier: "select", sender: self)
        }
    }
    /*
    //Instantiating View using code only
    @IBAction func selectPaper(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userChoice = getShape(sender)
        present(controller, animated: true, completion: nil)
    }
    
    //Instantiating the View using code + segue
    
    @IBAction func selectRock(_ sender: Any) {
        performSegue(withIdentifier: "select", sender: sender)
    }
    
    //Preparing the view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "select"{
            let controller = segue.destination as! ResultViewController
            controller.userChoice = getShape(sender as! UIButton)
        }
    }
    
    // The enum "Shape" represents a play or move
    private func getShape(_ sender: UIButton) -> Picture {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControl.State())!
        return Picture(rawValue: shape)!
    }*/
}


