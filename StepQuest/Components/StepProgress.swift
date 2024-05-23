//
//  StepProgress.swift
//  StepQuest
//
//  Created by Tristan McLaughlin on 23/05/2024.
//

import SwiftUI

struct StepProgress: View {
    let currentSteps: Int;
    let totalSteps: Int;
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.white.opacity(0.4),
                    lineWidth: 18
                )
            Circle()
                .trim(from: 0, to: progress) // 1
                .stroke(
                    Color.white,
                    style: StrokeStyle(
                        lineWidth: 18,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            VStack(alignment: .trailing, spacing: -7) {
                Text(String(currentSteps))
                    .font(.largeTitle)
                .tracking(-2)
                Text("/" + String(totalSteps))
                    .font(.title3)
                    .offset(x: 10)
                    .tracking(-1)
            }
            .foregroundColor(Color.white)
            .fontWeight(.bold)
        }
        .frame(width: 200.0, height: 200.0)
    }
    
    var progress: Double {
            guard totalSteps > 0 else { return 0 }
            return Double(currentSteps) / Double(totalSteps)
        }
}

struct StepProgressPreview: View {
    @State private var currentStepsDouble: Double = 0.0
    private let totalSteps: Int = 10000

    var body: some View {
        VStack {
            StepProgress(currentSteps: Int(currentStepsDouble), totalSteps: totalSteps)
            
            Slider(value: $currentStepsDouble, in: 0...Double(totalSteps), step: 1)
                .padding()
            
            Text("Current Steps: \(Int(currentStepsDouble))")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    StepProgressPreview()
    .padding()
    .background(Color.purple)
    .edgesIgnoringSafeArea(.all)
}
