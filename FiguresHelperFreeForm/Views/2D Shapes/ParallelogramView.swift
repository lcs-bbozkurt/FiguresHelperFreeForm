//
//  ParallelogramView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct ParallelogramView: View {
    
    // MARK: Stored properties
    @State var b = ""
    @State var h = ""
    @State var c = ""

    // MARK: Computed properties
    var area: Double {
        return b * h
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                DiagramView(image: "parallelogram",
                            horizontalPadding: 50)
                
                
                // Base
                Group {
                    
                    SectionLabelView(text: "Base", variable: "b")

                    // Input: Base
                   TextField("Base", text: $b, prompt: Text("Numeric value greater than 0."))
                    
                 

                }
                
                // Height
                Group {
                    
                    SectionLabelView(text: "Height", variable: "h")

                    // Input: Height
                   TextField("Height", text: $h, prompt: Text ("Numeric value greater than 0."))
                    // Output: Base
                    

                }

                // Diagonal
                Group {
                    
                    SectionLabelView(text: "Diagonal", variable: "c")

                    // Input: Diognal
                    TextField("Diognal", text: $c, prompt: Text("Numeric value greater than 0 and the height."))
                    
                    // Output: Base
                   

                }

                SectionLabelView(text: "Area", variable: "a")
                
                // Output: Area
                OutputValueView(value: area, suffix: "square units")
                
            }
            
        }
        .navigationTitle("Parallelogram")
        .padding()
    }
}

struct ParallelogramView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParallelogramView()
        }
    }
}
