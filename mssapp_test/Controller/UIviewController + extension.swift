    //
    //  UIviewController + extension.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 21/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit

    extension UIViewController {
        func PerformSegueToMainStoryBoard( with delay : TimeInterval) -> Void {
            perform( #selector (performSegueObjectivC) , with: nil, afterDelay: delay)
        }
       @objc private func performSegueObjectivC(){
            performSegue(withIdentifier:"toMainStoryBoard" , sender: nil)
        }
    }
