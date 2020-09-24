    //
    //  Router.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 18/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //


    import UIKit

    class Router{
        weak var  window :UIWindow?
        
        
        static let shared = Router()
        
        private init(){}
        
        func chooseMainViewController(){
           guard Thread.current.isMainThread else {
                DispatchQueue.main.async { [weak self ] in
                    self?.chooseMainViewController()
                }
                 return
            }
            
            let filename = "Main"
            let sb  = UIStoryboard(name: filename, bundle: .main)
            window?.rootViewController = sb.instantiateInitialViewController()
        }
    }
