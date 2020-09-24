    //
    //  SplashViewController.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 17/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit
    import PKHUD


    class SplashViewController: UIViewController {
      
      
        var movies:[Movie]!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        override func viewDidAppear(_ animated: Bool) {
                    //show "PKUHD" progress
                       
                        self.showProgress(on: self.view)
                         
                         do {
                             //check if the movies are already in the CoreData
                            movies = try CoreDataContext.share.fetch(Movie.fetchRequest())
                             if movies.capacity > 1  {
                                //move the the main segue
                                PerformSegueToMainStoryBoard(with: 2.0)
                                return}
                         }
                         catch{
                             self.errorPKHUD(on: self.view)
                         }
                         //if the movies are not in the coredata  then fetch them from internet
                         MoviesApi.fetchMovies { [weak self] (result , error) in
                             if let result = result {
                                 for movie in result {
                                     // initialise a new  coreData Movie
                                     let newMovie = Movie(context: CoreDataContext.share)
                                     newMovie.convertMovie(from: movie)
                                     
                                     //try to save a Movie
                                     do{try CoreDataContext.share.save()}catch{
                                        
                                        //unwrap the view
                                         guard let view = self?.view , let splash = self else {return}
                                         splash.errorPKHUD(on: view)
                                     }
                                     
                                 }
                                 //unwrap the view
                                 guard let view = self?.view , let splashController = self else {return}
                                 splashController.successPKHUD(on:view)
                                  splashController.PerformSegueToMainStoryBoard(with: 5.0)
                             }
                         }
        }
    }






