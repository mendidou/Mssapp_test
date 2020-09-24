    //
    //  MoviesApi.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 16/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import Foundation

    struct MoviesApi {
         private static let decoder = JSONDecoder()
        private static let url:URL? = URL(string: "https://api.androidhive.info/json/movies.json")
        
        //let session = URLSession.shared
        
        static func fetchMovies(callback: @escaping (_ data : [Moovie]? , _ error : Error? ) -> Void){
            
            guard let url = url else {return}

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    // callback on the ui thread.
                   
                    decoder.dateDecodingStrategy = .iso8601
                    do{
                        guard let data = data else {
                            callback(nil, error)
                            return
                        }
                        let results = try decoder.decode( [Moovie].self , from: data)
                        callback(results, nil)
                    }catch let err {
                        // report erroor
                        callback(nil, err)
                    }
                }
            }.resume()
            
        }
        
        static func fetchMovie(from string : String? ,callback : @escaping (_ data : Moovie? , _ error : Error? ) -> Void){
            DispatchQueue.main.async {
                // callback on the ui thread.
                
                decoder.dateDecodingStrategy = .iso8601
                
                do{
                    guard let string = string else {return}
                    let data = Data(string.utf8)
                    let results = try decoder.decode( Moovie.self , from: data)
                    callback(results, nil)
                }catch let err {
                    // report erroor
                    callback(nil, err)
                }
           }
            
        }
    }
