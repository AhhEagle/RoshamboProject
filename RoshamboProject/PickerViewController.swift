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
    @IBOutlet weak var buttonScissors: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectPaper(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userChoice = getShape(sender)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func selectRock(_ sender: Any) {
        performSegue(withIdentifier: "select", sender: sender)
    }
    
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
    }
}


