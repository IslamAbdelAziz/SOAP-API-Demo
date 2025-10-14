//
//  NumberToWordsViewModelTests.swift
//  SOAP_NetowrkLayerTests
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import XCTest
@testable import SOAP_NetowrkLayer

final class MockConvertNumberToWordsUseCase: ConvertNumberToWordsUseCase {
    var shouldThrow = false
    
    init() {
        super.init(repository: MockNumberConversionRepository())
    }
    
    override func execute(number: Int) async throws -> NumberConversionResult {
        if shouldThrow {
            throw NSError(domain: "TestError", code: -1)
        }
        return NumberConversionResult(number: number, words: "two hundred")
    }
}

@MainActor
final class NumberToWordsViewModelTests: XCTestCase {
    
    func test_convertNumber_successUpdatesResult() async {
        let mockUseCase = MockConvertNumberToWordsUseCase()
        let viewModel = NumberToWordsViewModel(useCase: mockUseCase)
        
        viewModel.numberInput = "200"
        await viewModel.convertNumber()
        
        XCTAssertEqual(viewModel.resultText, "two hundred")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func test_convertNumber_invalidInputShowsError() async {
        let mockUseCase = MockConvertNumberToWordsUseCase()
        let viewModel = NumberToWordsViewModel(useCase: mockUseCase)
        
        viewModel.numberInput = "abc"
        await viewModel.convertNumber()
        
        XCTAssertEqual(viewModel.errorMessage, "Please enter a valid number.")
        XCTAssertEqual(viewModel.resultText, "")
    }
    
    func test_convertNumber_failureShowsError() async {
        let mockUseCase = MockConvertNumberToWordsUseCase()
        mockUseCase.shouldThrow = true
        let viewModel = NumberToWordsViewModel(useCase: mockUseCase)
        
        viewModel.numberInput = "50"
        await viewModel.convertNumber()
        
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.resultText, "")
    }
}
