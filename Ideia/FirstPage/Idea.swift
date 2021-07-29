//
//  Idea.swift
//  Ideia
//
//  Created by Juliana Santana on 19/07/21.
//

import Foundation

struct Idea {
    var content: String
    var type: IdeaType
    
}

enum IdeaType: CaseIterable {
    case styles
    case food
    case feelings
    case tool
    case sentences
    case alphabet
    case anatomia
    case animal
    case object
    case cor
   
    
    var title: String {
        switch self {
        case .alphabet: return "Create something with the first letter"
        case .anatomia: return "Create something with"
        case .animal: return "Create something with"
        case .cor: return "Create something with the color"
        case .tool: return "Create something with"
        case .styles: return "Create something with style"
        case .object: return "Create something with"
        case .food: return "Create something with"
        case .feelings: return "Create something that express"
        case .sentences: return "Represent"
            }
        
    }
}

