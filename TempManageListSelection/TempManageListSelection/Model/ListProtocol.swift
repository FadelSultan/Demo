//
//  ListProtocol.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation

protocol ListProtocol:Hashable {
    var id:Int { get }
    var value:String { get }
}
