    //
    //  MovieTableViewCell.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 18/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit

    class MovieTableViewCell: UITableViewCell {
        @IBOutlet weak var titleMovie: UILabel!
        @IBOutlet weak var releaseYear: UILabel!
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
