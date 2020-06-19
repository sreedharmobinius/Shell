//
//  PhoneNumberRestManager.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Sreedhar Lakshmanan on 19/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//


import Foundation
import Foundation
import Alamofire

class PhoneNumberRestManager {

    func sendOTP(param: Parameters,  onCompletion: @escaping (Result<Any, CustomError>) -> ()) {
        
        //Use like below if you want to create format
        /*let urlPattern = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_GET_WORK_ORDERS
         let urlAPI = String(format: urlPattern,AnyID here)*/
        
        let urlAPI = RestConstants.BASE_URL + RestConstants.API_ENDPOINT_SENT_OTP
        
        RestAPIManager.shared.executeRequest(apiUrl: urlAPI,method: .post, parameters: param) { [weak self](request) in
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
                    let response = try decoder.decode(OTP.self, from: data)
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

// To decode the response from data
struct OTP: Codable {
       let success: Bool
       let message: String
       let payload: [Int]

       enum CodingKeys: String, CodingKey {
           case success
           case message
           case payload
       }
   }

//To decode the error response
struct requestError: Codable {
    let success: Bool
    let error: [String: String]

    enum CodingKeys: String, CodingKey {
        case success
        case error
    }
}

//To capture the error message from response and show to user.
protocol ErrorProtocol: LocalizedError {
    var title: String { get }
}

struct SendOTPError: ErrorProtocol {
    let title: String
    let titleDescription: String
}

