//
//  ContentView.swift
//  BMICalculator
//
//  Created by Doni Silva on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let backgroundImage = "bmiBackground"
        static let imageOpacity: CGFloat = 0.3
        static let textFieldWidth: CGFloat = 100
        static let titleText = "titleText".localized
        static let subTitleText = "subTitleText".localized
        static let textFieldWeightText = "textFieldWeightText".localized
        static let textFieldHeightText = "textFieldHeightText".localized
        static let textFieldWeightPlaceholder = "0"
        static let textFieldHeightPlaceholder = "0,0"
        static let buttonCalculateTitle = "buttonCalculateTitle".localized
    }
    
    @State private var weight: Double?
    @State private var height: Double?
    @State private var showModal = false
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Image(Constants.backgroundImage)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(Constants.imageOpacity)
                .ignoresSafeArea()
            content
        }
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: Metrics.huge) {
                VStack(spacing: Metrics.big) {
                    Text(Constants.titleText)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, Metrics.large)
                        .padding(.bottom, -Metrics.large)
                    
                    Text(Constants.subTitleText)
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                HStack {
                    VStack {
                        Text(Constants.textFieldWeightText)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        TextField(Constants.textFieldWeightPlaceholder, value: $weight, format: .number)
                            .keyboardType(.decimalPad)
                            .foregroundColor(.black).fontWeight(.bold)
                            .frame(width: Constants.textFieldWidth, height: Metrics.big)
                            .multilineTextAlignment(.center)
                            .background(Color.white)
                            .cornerRadius(Metrics.nano)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(Constants.textFieldHeightText)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        TextField(Constants.textFieldHeightPlaceholder, value: $height, format: .number)
                            .keyboardType(.decimalPad)
                            .foregroundColor(.black).fontWeight(.bold)
                            .frame(width: Constants.textFieldWidth, height: Metrics.big)
                            .multilineTextAlignment(.center)
                            .background(Color.white)
                            .cornerRadius(Metrics.nano)
                    }
                }
                .padding(.leading, Metrics.big)
                .padding(.trailing, Metrics.big)
                
                CustomButton(buttonText: Constants.buttonCalculateTitle) {
                    viewModel.calculateBMI(height ?? .zero, weight ?? .zero)
                    showModal = true
                }
                .sheet(isPresented: $showModal, content: {
                    ResultsView(bmi: viewModel.bmi, image: viewModel.finalImage, condition: viewModel.finalCondition, isPresented: $showModal)
                })
                .padding()
                .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
