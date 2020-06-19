//
//  OTPViewModel.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Sreedhar Lakshmanan on 19/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import Foundation
import Alamofire

class OTPViewModel {
    let otpRestManager: OTPRestManager = OTPRestManager()
    
    init() {
    }
    
    func verifyOTP(with parameters: String,  onCompletion: @escaping (Result<Any, CustomError>) -> ()) {
        otpRestManager.verifyOTP(param: parameters, onCompletion: {(result) in
            switch result {
            case .success( _):
                onCompletion(.success(result))
                break;
            case .failure( _):
                break;
            }
        })
        
    }

    
}
