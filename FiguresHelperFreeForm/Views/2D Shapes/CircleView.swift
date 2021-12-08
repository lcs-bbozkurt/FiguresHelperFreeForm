//
//  CircleView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct CircleView: View {
    
    // MARK: Stored properties
    // Whatever the user adds to the text view.
    @State var provideRadius = ""
    // Check the input given by the user
    // If possible, return a Double
    // Else, (bad input) return nil.
    
    @State var radius = 10.0
    
    // MARK: Computed properties
    // Check the input given by the user
    // If possible, return a Double
    // Else, (bad input) return nil.
    
    var radius: Double? {
        // Tests of the provided input.
        // 1. Ensure that we can simply change the input into a Double.
        // 2. Ensure that the valueu as a Double is more than zero.
        // With a guard statement we list things we wish to be true... adn provide an action to carry out when those conditions are not met.
        guard let radius = Double(provideRadius),
              radius > 0
        else {
            // When the tests are failed, we do not have a valid radius
            return nil
        }
        // If we get here we know radius is good, so we return radius.
        return radius 

    }
    
    var area: Double {
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius

                
                TextField("Radius", text: $provideRadius, prompt: Text("Numeric value greater than 0"))
                
                // Output: Radius
                SliderValueView(value: radius)
                
                SectionLabelView(text: "Area", variable: "")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Circle")
        .padding()
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CircleView()
        }
    }
}
