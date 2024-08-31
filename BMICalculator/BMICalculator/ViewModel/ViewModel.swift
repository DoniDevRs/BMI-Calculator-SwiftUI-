//
//  ViewModel.swift
//  BMICalculator
//
//  Created by Doni Silva on 01/08/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    private enum Constants {
        static let thinness = "thinness".localized
        static let underweight = "underweight".localized
        static let idealWeight = "idealWeight".localized
        static let overweight = "overweight".localized
        static let obesity = "obesity".localized
    }
    
    @Published var bmi = Double()
    @Published var finalCondition = ""
    @Published var finalImage = ""
    
    public func calculateBMI(_ height: Double, _ weight: Double) {
        bmi = weight / (height * height)
        showResults()
    }
    
    private func showResults() {
        var condition: String = ""
        var image: String = ""
        
        switch bmi {
        case 0..<16.0:
            condition = Constants.thinness
            image = "Thinness"
        case 16.0..<18.5:
            condition = Constants.underweight
            image = "Underweight"
        case 18.5..<25.0:
            condition = Constants.idealWeight
            image = "Ideal Weight"
        case 25.0..<30.0:
            condition = Constants.overweight
            image = "Overweight"
        default:
            condition = Constants.obesity
            image = "Obesity"
        }
        
        finalCondition = condition
        finalImage = image
    }
}
