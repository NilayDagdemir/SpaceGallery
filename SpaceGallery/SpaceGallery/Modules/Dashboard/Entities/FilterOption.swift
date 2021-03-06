//
//  FilterOption.swift
//  SpaceGallery
//
//  Created by Nilay Dagdemir on 25.01.2022.
//

import Foundation

// MARK: - FilterOptions
public enum FilterOption: String, CaseIterable {
    case curiosity, opportunity, spirit

    var title: String {
        switch self {
        case .curiosity: return "Curiosity"
        case .opportunity: return "Opportunity"
        case .spirit: return "Spirit"
        }
    }
}
