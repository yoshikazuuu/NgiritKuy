//
//  PriceRange.swift
//  NgiritKuy
//
//  Created by Jerry Febriano on 07/04/25.
//


enum PriceRange: Int, CaseIterable, Identifiable {
    case range0to5k = 0
    case range5to10k = 1
    case range10to15k = 2
    case range15to20k = 3
    case range20kPlus = 4
    
    var id: Int { self.rawValue }
    
    var displayName: String {
        switch self {
        case .range0to5k: return "0-5k"
        case .range5to10k: return "5-10k"
        case .range10to15k: return "10-15k"
        case .range15to20k: return "15-20k"
        case .range20kPlus: return "20k+"
        }
    }
    
    var min: Double {
        switch self {
        case .range0to5k: return 0
        case .range5to10k: return 5
        case .range10to15k: return 10
        case .range15to20k: return 15
        case .range20kPlus: return 20
        }
    }
    
    var max: Double {
        switch self {
        case .range0to5k: return 5
        case .range5to10k: return 10
        case .range10to15k: return 15
        case .range15to20k: return 20
        case .range20kPlus: return Double.infinity
        }
    }
}

