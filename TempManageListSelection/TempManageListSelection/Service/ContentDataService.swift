//
//  ContentDataService.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation

class ContentDataService {
    func fetchSquare() async throws -> [SquareModel] {
        do {
            return try await NetworkingManager.fetch([SquareModel].self, urlString: "https://amanty.alhasa.gov.sa:7003/HasaApp/main/execSrv/grvGetSquare;0=42217;1=4338038;2=4338038;")
        }catch {
            throw error
        }
    }
    
    
    func fetchMuncipility() async throws -> [MuncipilityModel] {
        do {
            return try await NetworkingManager.fetch([MuncipilityModel].self, urlString: "https://amanty.alhasa.gov.sa:7003/HasaApp/main/execSrv/getMunicipalityByIdNumber;0=4338038;1=4338038")
        }catch {
            throw error
        }
    }
    
}
