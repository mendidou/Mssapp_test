//
//  Movie+CoreDataProperties.swift
//  mssapp_test
//
//  Created by mendy aouizerat  on 17/09/2020.
//  Copyright © 2020 mendy aouizerat . All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseYear: Int64
    @NSManaged public var genre: [String]?

}
extension Movie{
    func convertMovie(from moovie : Moovie){
           self.title = moovie.title
           self.genre = moovie.genre
           self.image = moovie.image
           self.rating = moovie.rating
           self.releaseYear = Int64(moovie.releaseYear)
      }
}
