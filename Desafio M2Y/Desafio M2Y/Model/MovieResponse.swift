//
//  MovieResponse.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
