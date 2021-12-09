//
//  SphereView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct SphereView: View {
    
    // MARK: Stored properties
    // Whatever the user adds to the text field
    @State var providedRadius = ""
    
    
    // MARK: Computed properties
    // Check the input given by the user
    // If possible, return a Double
    // Otherwise (bad input) return nil
    var radius: Double? {
    // Tests of the provided input
        // 1. Ensure that we can simply change the input into a Double
        // 2. Ensure that we have a value as s Double is more than 0
        // With a "guard" statement, we list the things we wish to be true... and provide an action to carry out when those conditions are not met.
        guard let radius = Double(providedRadius),
              radius > 0
        else {
            // When the tests are failed, we do not have a valid radius
            return nil
        }
        // If we get here, we know the radius is good
               return radius
    }

        
        
        
        
        
            var surfaceArea: Double? {
                guard let radius = radius else {
                    return nil
                }

        return 4 * Double.pi * radius * radius
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "sphere",
                            horizontalPadding: 50)
                
                SectionLabelView(text: "Radius", variable: "r")

                // Input: Radius
                TextField("Radius", text: $providedRadius, prompt: Text( "Numeric value greater than 0"))
                
                // Output: Radius
           
                
                SectionLabelView(text: "Surface Area", variable: "")
                
                // Output: Area
                OutputValueView(value: surfaceArea, suffix: "cubed units")
                
            }
            
        }
        .navigationTitle("Sphere")
        .padding()
    }
}

struct SphereView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SphereView()
        }
    }
}
