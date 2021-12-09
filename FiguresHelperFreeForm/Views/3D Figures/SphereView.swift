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
    @State var radius = 10.0
    
    // MARK: Computed properties
    var surfaceArea: Double {
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
                SliderValueView(value: radius)
                
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
