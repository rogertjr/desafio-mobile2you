//
//  Movie.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let originalTitle: String
    let title: String
    let date: String
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case originalTitle = "original_title"
        case title
        case date = "release_date"
        case poster = "poster_path"
    }
}
