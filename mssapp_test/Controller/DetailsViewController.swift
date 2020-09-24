    //
    //  DetailsViewController.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 21/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit

    class DetailsViewController: UIViewController {
        var movie:Movie?
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var genreLabel: UILabel!
        @IBOutlet weak var imageMovie: UIImageView!
        @IBOutlet weak var ratingLabel: UILabel!
        @IBOutlet weak var releaseYearLabel: UILabel!
       
        
        override func viewDidLoad() {
            super.viewDidLoad()

            titleLabel.text = movie?.title
            genreLabel.text = movie?.genre?.joined(separator: ",")
            guard let rating = movie?.rating , let releaseYear = movie?.releaseYear , let imageString = movie?.image else {return}
            ratingLabel.text = String(rating)
            releaseYearLabel.text = String(releaseYear)
            let url = URL(string: imageString)
            imageMovie.downloaded(from: url!)
            
            
                    
            // Do any additional setup after loading the view.
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
