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
                              option4: "Thursday",
                              correctOption: .four),
                     Question(title: "Who is yj ?",
                              option1: "Nutella",
                              option2: "Potato",
                              option3: "Human",
                              option4: "Instructor",
                              correctOption: .one),
                     Question(title: "Who is jahen",
                              option1: "A machine that makes slides",
                              option2: "A school going kid",
                              option3: "A human",
                              option4: "Property of yj",
                              correctOption: .four),
                    Question(title: "what is shrek famous for", option1: "Animation", option2: "Voice", option3: "Writing", option4: "SHREK", correctOption: .four)]
    
    @State var currentQuestion = 0
    
    @State var correctAnswers = 0
    
    @State var isAlertPresented = false
    @State var isCorrect = false
    
    @State var isModalPresented = false
    
    let width = 150.0
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
                              message: Text(isCorrect ? "Congrats, you are kinda smart." : "What is this tomfoolery? i expected better ! hmp"),
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
