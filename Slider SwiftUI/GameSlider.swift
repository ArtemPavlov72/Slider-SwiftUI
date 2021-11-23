//
//  GameSlider.swift
//  Slider SwiftUI
//
//  Created by iMac on 23.11.2021.
//

import SwiftUI

struct GameSlider: View {
    @Binding var value: Double
    
    let customValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(customValue)")
            HStack {
                Text("0")
                Slider(value: $value, alpha: alpha, color: color)
                Text("100")
            }
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(
            value: .constant(50),
            customValue: 100,
            color: .red,
            alpha: 100)
    }
}
