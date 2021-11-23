//
//  ContentView.swift
//  Slider SwiftUI
//
//  Created by Pavlov Artem on 23.11.2021.
//

import SwiftUI

struct ContentView: View {
    @Binding var value: Double
    
    let customValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
