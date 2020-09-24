    //
    //  File.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 16/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import Foundation
    import PKHUD

    protocol PKHUD_Able {
    }

    extension PKHUD_Able{
        
        func showProgress(on view : UIView)  {
            HUD.show(.progress, onView: view)
        }
        func successPKHUD( on view : UIView ){
            HUD.flash(.success, onView:view, delay: 1.5, completion: nil)
        }
        func errorPKHUD(on view : UIView){
            HUD.flash(.error, onView:view, delay: 1.5, completion: nil)
        }
    }
//give the ability for every VIEWCONTROLLER to use Pkhud
    extension UIViewController:PKHUD_Able{}
