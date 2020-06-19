//
//  OTPRestManager.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Sreedhar Lakshmanan on 19/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//


import Foundation
import Foundation
import Alamofire

class OTPRestManager {

    func verifyOTP(param: String,  onCompletion: @escaping (Result<Any, CustomError>) -> ()) {
        
        //Use like below if you want to create format
        /*let urlPattern = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_GET_WORK_ORDERS
         let urlAPI = String(format: urlPattern,AnyID here)*/
        let urlPattern = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_SENT_OTP
        let urlAPI = String(format: urlPattern,param)
        
        RestAPIManager.shared.executeRequest(apiUrl: urlAPI,method: .get, parameters: nil ) { [weak self](request) in
            // guard let `self` = self else { return }
            
            guard let statusCode = request.response?.statusCode else {
                onCompletion(.failure(CustomError.NoDataFound))
                return
            }
            
            switch statusCode {
            case RestConstants.HTTP_CODE_OK:
                guard let data = request.data else {
                    // handle errors here
                    onCompletion(.failure(CustomError.NoDataFound))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(VerifyOTP.self, from: data)
                    onCompletion(.success(response))
                } catch {
                    print(error.localizedDescription)
                    onCompletion(.failure(CustomError.ParsingError))
                }
            default:
                onCompletion(.failure(.NoDataFound))
            }
        }
    }
    
    
}


struct VerifyOTP: Codable {
       let success: Bool
       let message: String

       enum CodingKeys: String, CodingKey {
           case success
           case message
       }
   }

struct OTPError: Codable {
    let success: Bool
    let error: [String: String]

    enum CodingKeys: String, CodingKey {
        case success
        case error
    }
}
