//
//  ViewController.swift
//  SegueAndNavigation2
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToYellow(unwindSegue : UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title=textfield.text
    }
    
    @IBAction func toggleSwitch(_ sender: Any) {
    }
    @IBAction func goTogreen(_ sender: Any) {
        if toggleSwitch.isOn {
            performSegue(withIdentifier: "green", sender: nil)
        }
        
    }
}

