//
//  CoreDataManage.swift
//  MiButaca
//
//  Created by Leti on 19/12/17.
//  Copyright © 2017 Leticia. All rights reserved.
//

import UIKit
import CoreData

protocol CoreDataProtocol {
    func saveMovie(movie: Movie)
    func fetchMovies() -> [Movie]
    func deleteAllRecords(entity: String)
}

class CoreDataManage: CoreDataProtocol {
    let movieEntity: String = Constants.coredataEntities.movies
    
    func saveMovie(movie: Movie) {
        let context = getContext()
        
        //retrieve the entity
        let entity =  NSEntityDescription.entity(forEntityName: movieEntity, in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        transc.setValue(movie.id, forKey: Constants.databases.id)
        transc.setValue(movie.title, forKey: Constants.databases.title)
        transc.setValue(movie.gender, forKey: Constants.databases.gender)
        transc.setValue(movie.picture, forKey: Constants.databases.image)
        transc.setValue(movie.score, forKey: Constants.databases.score)
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func fetchMovies() -> [Movie]{
        var movies: [Movie] = [Movie]()
        
        let fetchRequest = NSFetchRequest<MovieDC>(entityName: movieEntity)
        
        do {
            let fetchedResults = try getContext().fetch(fetchRequest)
            if fetchedResults.count > 0 {
                for item in fetchedResults{
                    let cMovie = Movie(id: item.id!, title: item.title!, gender: item.gender!, picture: item.image!, score: Int(item.score))
                    movies.append(cMovie)
                }
                
            }
        } catch let error as NSError {
            // something went wrong, print the error.
            print(error.description)
        }
        
        return movies
    }
    
    func deleteAllRecords(entity: String) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All recods removed!")
        } catch {
            print ("There was an error")
        }
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
