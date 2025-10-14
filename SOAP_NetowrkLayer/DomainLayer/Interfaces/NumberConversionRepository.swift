//
//  NumberConversionRepository.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import Foundation

protocol NumberConversionRepository {
    func convert(number: Int) async throws -> NumberConversionResult
}

