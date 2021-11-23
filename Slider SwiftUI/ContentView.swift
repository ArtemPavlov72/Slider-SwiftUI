//
//  ContentView.swift
//  Slider SwiftUI
//
//  Created by Pavlov Artem on 23.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var value = Int.random(in: 1...100)
    @State private var customValue = 50.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            GameSlider(
                value: $customValue,
                customValue: value,
                color: .red,
                alpha: getScore()
            )
            ButtonView(
                showAlert: $showAlert,
                title: "Проверь Меня!",
                currentScore: getScore(),
                action: { showAlert = true}
            )
            
            ButtonView(title: "Начать заново") {
                value = Int.random(in: 1...100)
            }
        }
        }
    
    private func getScore() -> Int {
        let difference = abs(value - lround(customValue))
        return 100 - difference
    }
    }

struct ButtonView: View {
    @Binding var showAlert: Bool
    let title: String
    let currentScore: Int
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text("\(currentScore)")
            }
    }
    init(showAlert: Binding<Bool> = .constant(false), title: String, currentScore: Int = 0, action:
         @escaping () -> Void) {
             self._showAlert = showAlert
             self.title = title
             self.currentScore = currentScore
             self.action = action
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
        )
    }
}
