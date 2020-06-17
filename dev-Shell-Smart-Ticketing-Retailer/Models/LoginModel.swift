//
//  LoginModel.swift
//  dev-Shell-Smart-Ticketing-Retailer
//
//  Created by Manoj on 12/06/20.
//  Copyright © 2020 Mobinius. All rights reserved.
//

import Foundation
import UIKit

struct LoginResponse : Codable {
    var success: String
    var message: String
    var payload : payloadDetail
}

struct payloadDetail : Codable {
    var IdUser: String
    var Name: String
    var PhoneNumber: String
    var Email: String
    var Password: String
    var Enabled: String
    var Status: String
    var TokenIdentifier: String
    var Role: String
    var AssignedAreas: String
    var `Type`: String
    var ROM: String
    var DealerId: String
    var AllocationStations: String
    var FirmName: String
    var ClusterId: String
    var CountryName: String
    var StateName: String
    var DistrictName: String
    var CityName: String
    var OTP: String
    var NewPhoneNumber: String
    var OtpVerify: String
    var SetExpire: String
    var createdAt: String
    var updatedAt: String
    var token: String
    var Role_details: Role_details

}

struct Role_details : Codable {
    var AccessibleModule: String
    var RoleId: String
    var RoleName : String
    var RoleDescription : String
    var createdAt : String
    var updatedAt : String

}
