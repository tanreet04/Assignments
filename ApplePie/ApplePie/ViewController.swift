//
//  ViewController.swift
//  ApplePie
//
//  Created by Student on 22/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer" , "Swift","glorious","bug","program"]
    let incorrectMovesAllowed = 7
    var totalWins=0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    var currentGame: Game!
    @IBOutlet var correctWordLevel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var treeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        newRound()
    }
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word:newWord, incorrectMovesRemaining: incorrectMovesAllowed,guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
        
    }
    func enableLetterButtons(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    func updateUI(){
        var letters = [String]()
        for letter in letters {
            letters.append(String(letter))
        }
        var wordWithSpacing = letters.joined(separator: " ")
        correctWordLevel.text = currentGame.formattedWord
        scoreLabel.text =  "Wins: \(totalWins) Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree-\(currentGame.incorrectMovesRemaining)")
        
    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else {
            updateUI()
        }
    }
    
    
    
}


