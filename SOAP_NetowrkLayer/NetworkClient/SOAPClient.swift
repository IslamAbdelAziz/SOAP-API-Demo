//
//  SOAPClient.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
}

struct SOAPClient {
    
    static func sendSOAPRequest(
        to urlString: String,
        soapAction: String,
        body: String
    ) async throws -> String {
        
        guard let url = URL(string: urlString) else {
            throw SOAPError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue(soapAction, forHTTPHeaderField: "SOAPAction")
        request.httpBody = body.data(using: .utf8)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print(String(data: data, encoding: .utf8) ?? "No body")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw SOAPError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw SOAPError.requestFailed(httpResponse.statusCode)
        }
        
        guard let xmlString = String(data: data, encoding: .utf8) else {
            throw SOAPError.invalidResponse
        }
        
        return xmlString
    }
}
