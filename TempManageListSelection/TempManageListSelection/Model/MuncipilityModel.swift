//
//  MuncipilityModel.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation

// MARK: - MuncipilityModelElement
struct MuncipilityModel: ListProtocol , Codable {
    
    var id: Int
    let outputMsg: String?
    var value: String
    let errorMsg: String?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "BDG_NO"
        case outputMsg
        case value = "BDGNAME"
        case errorMsg, success
    }
}
