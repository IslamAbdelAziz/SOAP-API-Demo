//
//  SOAP_NetowrkLayerUITests.swift
//  SOAP_NetowrkLayerUITests
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import XCTest

final class NumberToWordsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testConvertNumberToWordsFlow() {
        // 1. Find input field and enter number
        let inputField = app.textFields["numberInputField"]
        XCTAssertTrue(inputField.waitForExistence(timeout: 5))
        inputField.tap()
        inputField.typeText("100")
        
        // 2. Tap convert button
        let convertButton = app.buttons["convertButton"]
        XCTAssertTrue(convertButton.exists)
        convertButton.tap()
        
        // 3. Wait for result text to appear
        let resultText = app.staticTexts["resultText"]
        XCTAssertTrue(resultText.waitForExistence(timeout: 10))
        
        // 4. Validate the text output
        XCTAssertTrue(resultText.label.contains("one hundred".capitalized))
    }
}
