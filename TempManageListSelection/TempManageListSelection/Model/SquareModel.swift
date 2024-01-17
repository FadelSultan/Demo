//
//  ContentModel.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation


struct SquareModel:ListProtocol, Codable  {
    
    var id: Int
    var value: String
    let outputMsg: String?
    let errorMsg: String?
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case outputMsg
        case id = "SQUARE_ID"
        case errorMsg
        case value = "SQUARE_NAME"
        case success
    }
}
