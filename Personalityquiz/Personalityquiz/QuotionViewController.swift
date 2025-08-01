//
//  QuotionViewController.swift
//  Personalityquiz
//
//  Created by Kshitiz on 01/08/25.
//

import UIKit

class QuotionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
  
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
        var questions: [Question] = [
                Question(text: "Which food do you like the most?",
                         type: .single,
                         answers: [
                            Animal(text: "Steak", value: .lion),
                            Animal(text: "Fish", value: .cat),
                            Animal(text: "Carrots", value: .rabbit),
                            Animal(text: "Corn", value: .turtle),
                            
                         ]
                        ),
                
                Question(text: "Which activities do you enjoy?",
                         type: .multiple,
                         answers: [
                            Animal(text: "Swimming", value: .turtle),
                            Animal(text: "Sleeping", value: .cat),
                            Animal(text: "Cuddling", value: .rabbit),
                            Animal(text: "Eating", value: .lion)
                         ]
                        ),
                
                Question(text: "How much do you enjoy car rides?",
                         type: .ranged,
                         answers: [
                            Animal(text: "I dislike them", value: .cat),
                            Animal(text: "I get a little nervous", value: .rabbit),
                            Animal(text: "I barely notice them", value:.turtle),
                            Animal(text: "I love them", value: .lion)
                         ]
                        )
            ]
    
    var questionIndex = 0
    var answersChosen:[Animal] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI ()
            // Do any additional setup after loading the view.
        }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender{
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonTapped(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()

    }

    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
                let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
                
                answersChosen.append(currentAnswers[index])
                
                nextQuestion()
    }
    
    func updateUI(){
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
            
            let currentQuestion = questions[questionIndex]
            let currentAnswers = currentQuestion.answers
            let totalProgress = Float(questionIndex ) / Float(questions.count)
            
            navigationItem.title = "Question #\(questionIndex + 1)"
            questionLabel.text = currentQuestion.text
            questionProgressView.setProgress(totalProgress, animated:true)
            
            switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswers)
               
            case .multiple:
                updateMultipleStack(using: currentAnswers)
            case .ranged:
                updateRangedStack(using: currentAnswers)
                
                    }
                }
        func nextQuestion() {
            questionIndex += 1
            if questionIndex < questions.count {
                updateUI()
            } else {
                performSegue(withIdentifier: "Results", sender: nil)
            }
        }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return  ResultsViewController(coder: coder ,responses: answersChosen)
    }
    
    
        func updateSingleStack(using answers: [Animal]){
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Animal]){
            multipleStackView.isHidden = false
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
    func updateRangedStack(using answers: [Animal]){
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
        }
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
