//
//  PhoneNumberViewModel.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Sreedhar Lakshmanan on 19/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import Foundation
import Alamofire

class PhoneNumberViewModel {
    let phoneNumberRestManager: PhoneNumberRestManager = PhoneNumberRestManager()
    
    init() {
    }
    
    func sendOTP(with parameters: Parameters,  onCompletion: @escaping (Result<Any, CustomError>) -> ()) {
        phoneNumberRestManager.sendOTP(param: parameters, onCompletion: {(result) in
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
