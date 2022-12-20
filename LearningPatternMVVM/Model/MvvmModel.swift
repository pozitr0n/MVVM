//
//  MvvmModel.swift
//  LearningPatternMVVM
//
//  Created by Raman Kozar on 11/12/2022.
//

import Foundation

enum MvvmModel {
    
    case initial(Model)
    case loading(Model)
    case success(Model)
    case failure(Model)
    
    struct Model {
        
        let image: String
        let isHidden: Bool
        
    }
    
}
