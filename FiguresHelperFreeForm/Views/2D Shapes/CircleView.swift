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
    @State var providedRadius = ""
    // Check the input given by the user
    // If possible, return a Double
    // Else, (bad input) return nil.
    
    
    // MARK: Computed properties
    // Check the input given by the user
    // If possible, return a Double
    // Else, (bad input) return nil.
    
    var radius: Double? {
        // Tests of the provided input.
        // 1. Ensure that we can simply change the input into a Double.
        // 2. Ensure that the valueu as a Double is more than zero.
        // With a "guard statement" we list things we wish to be true... and provide an action to carry out when those conditions are not met.
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            // When the tests are failed, we do not have a valid radius
            return nil
        }
        // If we get here we know radius is good, so we return radius.
        return radius

    }
    // Attemps to calculate the area, if it can't ... returns nil
    var area: Double? {
        
        // Is the input actually a Double, or... is it Double? (might be nil)
        guard let radius = radius
        else {
            // We didn't have a valid radius
            // We can't calculate the area
            return nil
        }

      
        
        
        return Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "circle",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius

                
                TextField("Radius", text: $providedRadius, prompt: Text("Numeric value greater than 0"))
                // Ternary condition operator
                // One line of statement
                //   CONDITION                        TRUE             FALSE
                    .foregroundColor(radius == nil ? Color.red : Color.primary)
                
              
                
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
