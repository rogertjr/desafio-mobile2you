//
//  MovieService.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation
import Combine

enum MovieService {
    static let api = API()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
    static let apiKey = "4fdd8a236f643cd5e72ebf6a599b9733"
    static let imageBase = URL(string: "https://image.tmdb.org/t/p/original")!
}

extension MovieService {
    
    static func getDetails(movieID: Int) -> AnyPublisher<MovieDetail, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent("movie/\(movieID)"), resolvingAgainstBaseURL: true)
            else { fatalError("Erro ao criar o URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: self.apiKey)]

        let request = URLRequest(url: components.url!)

        return api.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func getSimilar(movieID: Int) -> AnyPublisher<MovieResponse, Error> {
        guard var components = URLComponents(url: baseUrl.appendingPathComponent("movie/\(movieID)/similar"), resolvingAgainstBaseURL: true)
            else { fatalError("Erro ao criar o URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: self.apiKey)]

        let request = URLRequest(url: components.url!)

        return api.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
