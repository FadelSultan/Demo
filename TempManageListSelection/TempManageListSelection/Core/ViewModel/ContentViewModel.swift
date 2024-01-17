//
//  ContentViewModel.swift
//  TempManageListSelection
//
//  Created by Fadel Sultan on 09/01/2024.
//

import Foundation

@MainActor
class ContentViewModel:ObservableObject {
    
    private let dataService = ContentDataService()
    
    @Published var squareList:[SquareModel] = []
    @Published var squareSelected:SquareModel? = nil
    
    @Published var muncipilityList:[MuncipilityModel] = []
    @Published var muncipilitySelected:MuncipilityModel? = nil
    
    
    func fetchSquare() async {
        do {
            squareList = try await dataService.fetchSquare()
        }catch {
            print("Error fetchSquare: \(error)")
        }
    }
    
    func fetchMuncipility() async {
        do {
            muncipilityList = try await dataService.fetchMuncipility()
        }catch {
            print("Error fetchMuncipility: \(error)")
        }
    }
}
