//
//  Slider.swift
//  Slider SwiftUI
//
//  Created by Pavlov Artem on 23.11.2021.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    
    @Binding var value: Double //значение ползунка берем из ContentView
    let alpha: Int
    let color: UIColor
    
    //создаем слайдер
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        view.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

//класс Coordinator
extension Slider {
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(value: .constant(50), alpha: 100, color: .red)
    }
}
