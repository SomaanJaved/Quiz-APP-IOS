//
//  Question.swift
//  MCQuizler
//
//  Created by Abdul Basit on 30/01/2020.
//  Copyright © 2020 RommanApps. All rights reserved.
//

import Foundation

struct Question {
   let text: String
   let options: [String]
    let answer: String
    
    init(q:String, a:[String], correctAsnwer: String) {
        text = q
        options = a
        answer = correctAsnwer
    }
}
