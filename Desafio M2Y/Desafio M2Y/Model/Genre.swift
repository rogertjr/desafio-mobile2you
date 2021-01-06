//
//  Genre.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation

struct Genre: Codable, Identifiable {
    var id = UUID()
    let genreId: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case genreId = "id"
        case name
    }
}
