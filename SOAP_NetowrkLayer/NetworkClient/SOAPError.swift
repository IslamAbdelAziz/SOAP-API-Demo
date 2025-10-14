//
//  SOAPError.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import Foundation

enum SOAPError: Error, Equatable {
    case invalidURL
    case requestFailed(Int)
    case invalidResponse
    case parsingFailed
}
