//
//  Question.swift
//  Personalityquiz
//
//  Created by Kshitiz on 01/08/25.
//

import Foundation

struct Question{
    var text : String
    var type : ResponseType
    var answers : [Animal]
}
enum ResponseType{
    case single , multiple , ranged
  
}
struct Animal{
    var text : String
    var value : AnimalType
}
enum AnimalType: Character{
    case lion = "🦁"
    case cat = "🐱"
    case rabbit = "🐇"
    case turtle = "🐢"
    var definition : String {
        switch self {
        case .lion:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with  your friends"
        case .cat:
            return "Mischievous, yet mild-tempered,you enjoy doing things on your own terms"
        case .rabbit:
            return "You love eveything that's soft. You are very healthy and full of energy"
        case .turtle:
            return "You are wise beyond your years, and you focus on the details .Slow and steady wins the race"
        }
    }
}
