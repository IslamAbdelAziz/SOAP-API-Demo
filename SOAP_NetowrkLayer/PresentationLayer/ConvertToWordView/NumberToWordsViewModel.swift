//
//  NumberToWordsViewModel.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import Foundation

@MainActor
final class NumberToWordsViewModel: ObservableObject {
    @Published var numberInput = ""
    @Published var resultText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let useCase: ConvertNumberToWordsUseCase
    
    init(useCase: ConvertNumberToWordsUseCase) {
        self.useCase = useCase
    }
    
    func convertNumber() async {
        guard let num = Int(numberInput) else {
            errorMessage = "Please enter a valid number."
            return
        }
        
        isLoading = true
        errorMessage = nil
        resultText = ""
        
        do {
            let result = try await useCase.execute(number: num)
            resultText = result.words
        } catch {
            errorMessage = "Failed: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
