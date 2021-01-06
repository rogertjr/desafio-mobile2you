//
//  MovieDetail.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 01/01/21.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let title: String
    let backdrop: String
    let poster: String?
    let votes: Int
    let popularity: Float
    
    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case title
        case backdrop = "backdrop_path"
        case votes = "vote_count"
        case popularity
        case poster = "poster_path"
    }
}
