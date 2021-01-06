//
//  Genre.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation
import SwiftUI

struct GenreResponse: Decodable {
    let genres: [Genre]
}

struct Genre: Decodable, Identifiable {
    let id: Int
    let name: String
}

extension Array where Element == Genre {
    var formattedString: String {
        map { $0.name }.joined(separator: ", ")
    }
}
