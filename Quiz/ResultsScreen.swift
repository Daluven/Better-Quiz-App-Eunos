//
//  ResultsScreen.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ResultsScreen: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .bottom, endPoint: .leading)
                .ignoresSafeArea(.all)
            
            VStack {
                ZStack {
                    Text("\(Double(score) / Double(totalQuestions) * 100, specifier: "%.1f")%")
                        .font(.title)
                    CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                        .frame(width: 250, height: 250)
                    .padding(30)
                }
                Text("You got")
                    .font(.title2)
                Text("\(score)/\(totalQuestions)")
                    .font(.title)
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(score: 2, totalQuestions: 3)
    }
}
