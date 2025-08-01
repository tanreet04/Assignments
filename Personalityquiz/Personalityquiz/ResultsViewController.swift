//
//  ResultsViewController.swift
//  Personalityquiz
//
//  Created by Kshitiz on 01/08/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinationLabel: UILabel!
    
    var responses: [Animal]
    
    init?(coder: NSCoder, responses: [Animal]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, animal) in counts[animal.value, default: 0] += 1
        }
        
        //        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) { (counts, answer) in
        //            if let existingCount = counts[answer.type] {
        //                counts[answer.type] = existingCount + 1
        //            } else {
        //                counts[answer.type] = 1
        //            }
        //        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinationLabel.text = mostCommonAnswer.definition
    }
}
