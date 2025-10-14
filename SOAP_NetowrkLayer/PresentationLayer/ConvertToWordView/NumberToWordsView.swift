//
//  NumberToWordsView.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import SwiftUI

struct NumberToWordsView: View {
    @StateObject private var viewModel: NumberToWordsViewModel
    
    init() {
        let repo = NumberConversionRepositoryImpl()
        let useCase = ConvertNumberToWordsUseCase(repository: repo)
        _viewModel = StateObject(wrappedValue: NumberToWordsViewModel(useCase: useCase))
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Convert Numbers to Text!")
                .font(.largeTitle)
                .bold()
            
            TextField("Enter a number", text: $viewModel.numberInput)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .accessibilityIdentifier("numberInputField")

            
            Button {
                viewModel.resultText.removeAll()
                Task { await viewModel.convertNumber() }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                        .accessibilityIdentifier("loadingIndicator")

                } else {
                    Text("Convert")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            .accessibilityIdentifier("convertButton")

            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            if !viewModel.resultText.isEmpty {
                Text(viewModel.resultText.capitalized)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .padding()
                    .accessibilityIdentifier("resultText")
            }
            
            Spacer()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NumberToWordsView()
}
