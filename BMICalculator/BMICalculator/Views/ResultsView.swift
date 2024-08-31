//
//  ResultsView.swift
//  BMICalculator
//
//  Created by Doni Silva on 01/08/24.
//

import SwiftUI

struct ResultsView: View {
    
    private enum Constants {
        static let imageSize: CGFloat = 180
        static let infoTitleText = "infoTitleText".localized
        static let buttonRecalculateTitle = "buttonRecalculateTitle".localized
        static let buttonColor = "BMIBlue"
    }
    
    var bmi: Double
    var image: String
    var condition: String
    
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2499241763, green: 0.4583145159, blue: 1, alpha: 1)), .black]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack(spacing: Metrics.large) {
                Spacer()

                VStack(alignment: .center, spacing: Metrics.large) {
                    Text(Constants.infoTitleText)
                        .font(.system(size: Metrics.large, weight: .light, design: .default))
                    
                    Text("\(String(format: "%.1f", bmi))")
                        .font(.system(size: Metrics.huge, weight: .heavy, design: .default))
                    
                    Image("\(image)")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                    
                    Text("\(condition)")
                        .font(.system(size: Metrics.large, weight: .regular, design: .default))
                }
                
                Spacer()
                
                CustomButton(buttonText: Constants.buttonRecalculateTitle) {
                    isPresented = false
                }
                .padding()
            }
            .padding(Metrics.small)
        }
    }
}

#Preview {
    ResultsView(bmi: 25.0, image: "Thinness", condition: "Thinness", isPresented: .constant(true))
        .preferredColorScheme(.dark)
}
