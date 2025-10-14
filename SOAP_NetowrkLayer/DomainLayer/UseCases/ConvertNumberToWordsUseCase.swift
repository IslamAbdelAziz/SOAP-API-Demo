//
//  ConvertNumberToWordsUseCase.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

struct ConvertNumberToWordsUseCase {
    private let repository: NumberConversionRepository
    
    init(repository: NumberConversionRepository) {
        self.repository = repository
    }
    
    func execute(number: Int) async throws -> NumberConversionResult {
        try await repository.convert(number: number)
    }
}
