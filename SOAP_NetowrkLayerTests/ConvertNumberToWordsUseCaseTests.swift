//
//  ConvertNumberToWordsUseCaseTests.swift
//  SOAP_NetowrkLayerTests
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import XCTest
@testable import SOAP_NetowrkLayer

final class MockNumberConversionRepository: NumberConversionRepository {
    var shouldThrowError = false
    var lastRequestedNumber: Int?
    
    func convert(number: Int) async throws -> NumberConversionResult {
        lastRequestedNumber = number
        
        if shouldThrowError {
            throw NSError(domain: "TestError", code: -1)
        }
        
        return NumberConversionResult(number: number, words: "one hundred")
    }
}


final class ConvertNumberToWordsUseCaseTests: XCTestCase {
    
    func test_execute_returnsExpectedResult() async throws {
        // Given
        let mockRepo = MockNumberConversionRepository()
        let useCase = ConvertNumberToWordsUseCase(repository: mockRepo)
        
        // When
        let result = try await useCase.execute(number: 100)
        
        // Then
        XCTAssertEqual(result.number, 100)
        XCTAssertEqual(result.words, "one hundred")
        XCTAssertEqual(mockRepo.lastRequestedNumber, 100)
    }
    
    func test_execute_throwsErrorWhenRepositoryFails() async {
        let mockRepo = MockNumberConversionRepository()
        mockRepo.shouldThrowError = true
        let useCase = ConvertNumberToWordsUseCase(repository: mockRepo)
        
        do {
            _ = try await useCase.execute(number: 50)
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(true, "Error thrown as expected")
        }
    }
}
