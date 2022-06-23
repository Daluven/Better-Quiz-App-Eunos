//
//  ContentView.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    
    let questions = [Question(title: "What day is it?",
                              option1: "Monday",
                              option2: "Friday",
                              option3: "Wednesday",
                              option4: "Saturday",
                              correctOption: .four),
                     Question(title: "What framework are we using?",
                              option1: "UIKit",
                              option2: "SwiftU I",
                              option3: "React Native",
                              option4: "Flutter",
                              correctOption: .two),
                     Question(title: "Which company created Swift?",
                              option1: "Apple",
                              option2: "Orange",
                              option3: "Google",
                              option4: "Tinkercademy",
                              correctOption: .one)]
    
    @State var currentQuestion = 0
    
    @State var correctAnswers = 0
    
    @State var isAlertPresented = false
    @State var isCorrect = false
    
    @State var isModalPresented = false
    
    let width = 130.0
    let height = 60.0
    let cornerRadius = 15.0
    let shadowRadius = 5.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .trailing)
                .ignoresSafeArea(.all)
            VStack {
                ProgressView(value: Double(currentQuestion),
                             total: Double(questions.count))
                .padding()
                Text(questions[currentQuestion].title)
                    .frame(width: 280, height: 120)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: shadowRadius)
                    .padding()
                HStack {
                    VStack {
                        Button {
                            didTapOption(optionNumber: .one)
                        } label: {
                            Image(systemName: "triangle.fill")
                            Text((questions[currentQuestion].option1))
                        }
                        .frame(width: width, height: height)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        
                        Button {
                            didTapOption(optionNumber: .two)
                        } label: {
                            Image(systemName: "diamond.fill")
                            Text((questions[currentQuestion].option2))
                        }
                        .frame(width: width, height: height)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                    }
                    .foregroundColor(.white)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: shadowRadius)
                    .padding()
                    
                    VStack {
                        Button {
                            didTapOption(optionNumber: .three)
                        } label: {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].option3)
                        }
                        .frame(width: width, height: height)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        
                        Button {
                            didTapOption(optionNumber: .four)
                        } label: {
                            Image(systemName: "square.fill")
                            Text((questions[currentQuestion].option4))
                        }
                        .frame(width: width, height: height)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                    }
                    .alert(isPresented: $isAlertPresented) {
                        
                        Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                              message: Text(isCorrect ? "Congrats, you are kinda smart." : "This is outrageous, with such easy questions, how can you be getting this wrong?!"),
                              dismissButton: .default(Text("OK")) {
                            currentQuestion += 1
                            
                            if currentQuestion == questions.count {
                                isModalPresented = true
                                currentQuestion = 0
                            }
                        })
                    }.sheet(isPresented: $isModalPresented) {
                        ResultsScreen(score: correctAnswers, totalQuestions: questions.count)
                    }
                .padding()
                }
            }
        }
    }
    func didTapOption(optionNumber: CorrectOptions) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
