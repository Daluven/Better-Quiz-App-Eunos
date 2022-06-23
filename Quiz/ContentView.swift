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
    
    let width = 130.0
    let height = 200.0
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
                    .frame(width: 290, height: 200)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(cornerRadius)
                    .shadow(radius: shadowRadius)
                    
                
                HStack {
                    
                    VStack {
                        //Button 1
                        Button {
                        } label: {
                            ZStack{
                                Image(systemName: "triangle.fill")
                                    .font(.system(size: 72))
                                    .opacity(0.2)
                                Text((questions[currentQuestion].option1))
                                    .font(.system(size: 24))
                                    .bold()
                                    .padding()
                            }
                        }
                        .frame(width: width, height: height)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        .onTapGesture {
                            didTapOption(optionNumber: .one)
                        }
                        
                        //Button 2
                        Button {
                        } label: {
                            ZStack{
                                Image(systemName: "diamond.fill")
                                    .font(.system(size: 72))
                                    .opacity(0.2)
                                Text((questions[currentQuestion].option2))
                                    .font(.system(size: 24))
                                    .bold()
                                    .padding()
                            }
                        }
                        .frame(width: width, height: height)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        .onTapGesture {
                            didTapOption(optionNumber: .two)
                        }
                    }
                    .padding()
                    
                    
                    VStack {
                        //Button 3
                        Button {
                        } label: {
                            ZStack{
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 72))
                                    .opacity(0.2)
                                Text((questions[currentQuestion].option3))
                                    .font(.system(size: 24))
                                    .bold()
                                    .padding()
                            }
                        }
                        .frame(width: width, height: height)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        .onTapGesture {
                            didTapOption(optionNumber: .three)
                        }
                        
//                        Button 4
                        Button {
                        } label: {
                            ZStack{
                                Image(systemName: "square.fill")
                                    .font(.system(size: 72))
                                    .opacity(0.2)
                                Text((questions[currentQuestion].option4))
                                    .font(.system(size: 22))
                                    .bold()
                                    .padding()
                            }
                        }
                        .frame(width: width, height: height)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRadius)
                        .shadow(radius: shadowRadius)
                        .onTapGesture {
                            didTapOption(optionNumber: .four)
                        }
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
