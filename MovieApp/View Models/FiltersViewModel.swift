//
//  FiltersViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 10/1/22.
//

import Foundation

class FiltersViewModel: ObservableObject {
    
    func filterMoviesByDateRange(startDate: Date, endDate: Date) -> [MovieViewModel] {
        return Movie.byReleaseDateRange(startDate: startDate, endDate: endDate).map(MovieViewModel.init)
    }
    
    func filterMoviesByReleaseDate(releaseDate: Date) -> [MovieViewModel] {
        return Movie.byReleaseDate(releaseDate: releaseDate).map(MovieViewModel.init)
    }
    
    func filterMoviesByDateRangeOrRating(startDate: Date?, endDate: Date?, rating: Int?) -> [MovieViewModel] {
        return Movie.byReleaseDateRangeOrRating(startDate: startDate, endDate: endDate, rating: rating).map(MovieViewModel.init)
    }
    
    func filterMoviesByTitle(title: String) -> [MovieViewModel] {
        return Movie.byMovieTitle(title: title).map(MovieViewModel.init)
    }
}
