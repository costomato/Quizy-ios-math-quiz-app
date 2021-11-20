//
//  ContentView.swift
//  Quizy
//
//  Created by Kaustubh on 20/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var answer = 0
    @State private var options: [Int] = [0,1,2,3]
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var difficulty = 100
    @State private var score = 0 
    
    var body: some View {
        VStack{
            Text("\(num1) + \(num2)")
                .font(.largeTitle)
                .bold()
            
            HStack {
                ForEach(0..<2) {index in
                    Button {
                        isAnswerCorrect(answer: options[index])
                        getAnswers()
                    } label: {
                        AnswerButton(number: options[index])
                    }
                    
                }
            }
            
            HStack {
                ForEach(2..<4) {index in
                    Button {
                        isAnswerCorrect(answer: options[index])
                        getAnswers()
                    } label: {
                        AnswerButton(number: options[index])
                    }
                    
                }
            }
            
            Text("Score: \(score)")
                .font(.system(size: 24))
                .bold()
            
        }.onAppear(perform: getAnswers)
        
    }
    
    func isAnswerCorrect(answer: Int) {
        if answer==self.answer {
            self.score+=1
        }else{
            self.score-=1
        }
    }
    
    func getAnswers() {
        num1 = Int.random(in: 0...(difficulty/2))
        num2 = Int.random(in: 0...(difficulty/2))
        
        var choices = [Int]()
        answer = num1+num2
        for _ in 0...2 {
            choices.append(Int.random(in: 0...difficulty))
        }
        choices.append(answer)
        options = choices.shuffled()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
