//
//  NumberConversionRepository.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import Foundation

final class NumberConversionRepositoryImpl: NumberConversionRepository {
    func convert(number: Int) async throws -> NumberConversionResult {
        let endpoint = "https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
        let soapAction = "http://www.dataaccess.com/webservicesserver/NumberConversion.wso/NumberToWords"
        
        let body = """
        <?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                       xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                       xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
              <ubiNum>\(number)</ubiNum>
            </NumberToWords>
          </soap:Body>
        </soap:Envelope>
        """
        
        let response = try await SOAPClient.sendSOAPRequest(to: endpoint, soapAction: soapAction, body: body)
        let words = parseSOAPResponse(response) ?? "N/A"
        return NumberConversionResult(number: number, words: words)
    }
    
    private func parseSOAPResponse(_ xml: String) -> String? {
        guard let start = xml.range(of: "<m:NumberToWordsResult>"),
              let end = xml.range(of: "</m:NumberToWordsResult>") else {
            return nil
        }
        return String(xml[start.upperBound..<end.lowerBound]).trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

