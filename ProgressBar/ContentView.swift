//
//  ContentView.swift
//  ProgressBar
//
//  Created by mac on 13/05/24.
//

import SwiftUI

enum ProgressStage: Int {
    case step0 = 0
    case step1 = 1
    case step2 = 2
    case step3 = 3
    case step4 = 4
    
    var color: Color {
        switch self {
        case .step0: return .gray
        case .step1: return .green
        case .step2: return .red
        case .step3: return .purple
        case .step4: return .green
        }
    }
}

struct ContentView: View {
    @State var currentStage: ProgressStage = .step0
    
    var currentStageValue: Int {
        currentStage.rawValue
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                if currentStageValue >= 1 {
                    StageView()
                } else {
                    StageView(imageName: "pc", fColor: .gray, showBorder: currentStage == .step0)
                }
                
                if currentStageValue >= 2 {
                    StageView()
                } else {
                    StageView(imageName: "house.circle.fill", fColor: .gray, showBorder: currentStage == .step1)
                }
                
                if currentStageValue >= 3 {
                    StageView()
                } else {
                    StageView(imageName: "person", fColor: .gray, showBorder: currentStage == .step2)
                }
                
                if currentStageValue >= 4 {
                    StageView(showLine: false)
                } else {
                    StageView(imageName: "lock", fColor: .gray, showLine: false, showBorder: currentStage == .step3)
                }
            }
            .padding()
            
            Spacer()
            
            Text("Step \(currentStage.rawValue)")
                .font(.title)
                .padding(40)
                .background(currentStage.color)
            
            Button("next Step") {
                currentStage = ProgressStage(rawValue: currentStage.rawValue + 1) ?? .step0
            }
            
            Spacer()
            
        }
    }
}

struct StageView: View {
    var imageName: String = "checkmark.circle"
    var fColor: Color = .green
    var showLine = true
    var showBorder = false
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(fColor)
                .padding(5)
                .overlay {
                    Circle()
                        .stroke(.secondary, lineWidth: showBorder ? 1 : 0)
                }
            
            if showLine {
                VStack {
                    Divider()
                        .frame(height: 2)
                        .overlay(fColor)
                }
            }
        }
        .animation(.linear, value: fColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
