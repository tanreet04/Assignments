//
//  ViewController.swift
//  GuidedProject-LIGHT
//
//  Created by Student on 01/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightButton: UIButton!
    
    
    var lightOn=true
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}

