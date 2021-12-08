//
//  OutputValueView.swift
//  FiguresHelperFreeForm
//
//  Created by Russell Gordon on 2021-12-04.
//

import SwiftUI

struct OutputValueView: View {
    
    // MARK: Stored properties
    let value: Double
    let suffix: String
    
    // MARK: Computed properties
    // When there is an actual value to shoe, present it rounded to one decimal place.
    // When there is no value to show (nil) present
    var output: String {
        if let value = value {
            // We have valid value to show
            let formattedValue = String(format: "%.1f", value)
            // return the output to show
            return "\(formattedValue) \(suffix)"
        } else {
            return "Cannot currently be computed."
            
            
            
            
    
        }
    }
    
    var body: some View {
        Text(output)
            .font(.title3)
            .bold()
    }
}

struct OutputValueView_Previews: PreviewProvider {
    static var previews: some View {
        OutputValueView(value: 12131.121,
                        suffix: "square units")
    }
}
