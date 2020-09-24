    //
    //  CoreDataContext.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 23/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit
    import CoreData

    
    class CoreDataContext {
        // share the view "context" the the all app
       static let share = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        private init(){}
    }
