//
//  ContentView.swift
//  SOAP_NetowrkLayer
//
//  Created by iSlam AbdelAziz on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button  {
                Task {
                    await callSOAPRequest()
                }
            } label: {
                Text ("Do SOAP Call")
            }

        }
        .padding()
        
    }
        
    
    func callSOAPRequest() async {
        let endpoint = "https://www.dataaccess.com/webservicesserver/NumberConversion.wso"
        let soapAction = "http://www.dataaccess.com/webservicesserver/NumberConversion.wso/NumberToWords"
                
        let body = """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
          <ubiNum>123</ubiNum>
        </NumberToWords>
      </soap:Body>
    </soap:Envelope>
    """
        
        do {
            let response = try await SOAPClient.sendSOAPRequest(
                to: endpoint,
                soapAction: soapAction,
                body: body
            )
            print("✅ Success:\n\(response)")
        } catch {
            print("❌ Error: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
