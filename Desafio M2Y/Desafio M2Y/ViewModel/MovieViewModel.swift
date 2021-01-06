//
//  MovieViewModel.swift
//  Desafio M2Y
//
//  Created by Rogério Toledo on 30/12/20.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {

    @Published var movieDetails: MovieDetail?
    @Published var movieSimilarMovieList: [Movie] = []
    
    var task: AnyCancellable?
    
    init(movieID: Int) {
        getMovieDetails(id: movieID)
    }
    
}

extension MovieViewModel {
    
    func getMovieDetails(id: Int) {
        task = MovieService.getDetails(movieID: id)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    print($0) // todo: remover
                    self.movieDetails = $0
                    self.getSimilarMovies(id: id)
            })
    }

    func getSimilarMovies(id: Int) {
        task = MovieService.getSimilar(movieID: id)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    print($0.movies)
                    self.movieSimilarMovieList = $0.movies
            })
    }
}
