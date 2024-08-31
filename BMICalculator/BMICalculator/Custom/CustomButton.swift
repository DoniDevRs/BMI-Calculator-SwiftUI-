//
//  CustomButton.swift
//  BMICalculator
//
//  Created by Doni Silva on 01/08/24.
//

import SwiftUI

import SwiftUI

struct CustomButton: View {
    
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        
        ZStack {
            Button {
                action()
            } label: {
                Text("\(buttonText)")
                    .font(.system(size: Metrics.medium, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity)
                    .frame(height: Metrics.huge)
                    .background(BackgroundButton())
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: Metrics.tiny))
            }
        }
    }
}

#Preview {
    CustomButton(buttonText: "Calculate") {
        // do something
    }
}


