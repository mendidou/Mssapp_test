    //
    //  MoviesTableViewController.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 18/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit
    import CoreData

    class MoviesTableViewController: UITableViewController {
        
        @IBOutlet weak var refreshController: UIRefreshControl!
       
        var libraryMovies:[Movie]?

        override func viewDidLoad() {
            super.viewDidLoad()
            // pull to refresh the TableViewController
            self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
            do {
                libraryMovies = try CoreDataContext.share.fetch(Movie.fetchRequest())
                libraryMovies?.sort(by: { (movie, movie2) -> Bool in
                    if movie.releaseYear < movie2.releaseYear{
                        return false
                    }
                   return true
                })
               
            }
            catch{}

            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            
             //self.navigationItem.rightBarButtonItem = self.editButtonItem
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return libraryMovies!.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell

            guard let libraryMovies = libraryMovies else {return cell}
            let selected = libraryMovies[indexPath.row]
            cell.titleMovie.text = selected.title
            cell.releaseYear.text = String(selected.releaseYear)
            
            // Configure the cell...

            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "DetailsSegue", sender: indexPath.row)
        }

       
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let selectedRaw = tableView.indexPathForSelectedRow?.row , let movie = self.libraryMovies?[selectedRaw] else {return}
            
            if let target = segue.destination as? DetailsViewController {
                target.movie = movie
                
            }
        }
        @objc func refresh(sender:AnyObject)
        {
            // Updating your data here...
            viewDidLoad()
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
