//
//  FiltersViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 10/1/22.
//

import Foundation

class FiltersViewModel: ObservableObject {
    
    func filterMoviesByReleaseDate(releaseDate: Date) -> [MovieViewModel] {
        return Movie.byReleaseDate(releaseDate: releaseDate).map(MovieViewModel.init)
    }
    
}
