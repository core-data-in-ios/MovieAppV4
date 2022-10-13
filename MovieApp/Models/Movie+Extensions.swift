//
//  Movie+Extensions.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/11/21.
//

import Foundation
import CoreData

extension Movie: BaseModel {
    
    
    static func byMovieTitle(title: String) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Movie.title), title)
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    static func byReleaseDateRangeOrRating(startDate: Date?, endDate: Date?, rating: Int?) -> [Movie] {
        
        var sDate = Date.distantPast
        var eDate = Date.distantFuture
        var r = 0
        
        if startDate != nil { sDate = startDate! }
        if endDate != nil { eDate = endDate! }
        if rating != nil { r = rating! }
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@ AND %K >= %i",
                                        #keyPath(Movie.releaseDate), sDate as NSDate,
                                        #keyPath(Movie.releaseDate), eDate as NSDate,
                                        #keyPath(Movie.rating), r as NSInteger)
        
        // This implementation is an and of dates and rating.
        // The instructor does it as an or
        // he creates two seperate predicates, and then uses NSCompoundPredicate
        
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    
    static func byReleaseDateRange(startDate: Date, endDate: Date) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@", #keyPath(Movie.releaseDate), startDate as NSDate, #keyPath(Movie.releaseDate), endDate as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    static func byActorName(name: String) -> [Movie] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "actors.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
    static func byReleaseDate(releaseDate: Date) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@", #keyPath(Movie.releaseDate), releaseDate as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
