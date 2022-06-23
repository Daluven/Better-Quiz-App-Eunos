//
//  CircularProgressView.swift
//  Quiz
//
//  Created by T Krobot on 23/6/22.
//

import SwiftUI

struct CircularProgressView: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .opacity(0.3)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 30.0,
                                     lineCap: .round,
                                     lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 2)
    }
}
