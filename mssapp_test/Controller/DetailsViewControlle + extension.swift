    //
    //  DetailsViewControlle + extension.swift
    //  mssapp_test
    //
    //  Created by mendy aouizerat  on 25/09/2020.
    //  Copyright © 2020 mendy aouizerat . All rights reserved.
    //

    import UIKit
    import AVFoundation
    extension ScannerViewController : AVCaptureMetadataOutputObjectsDelegate{
        
       
        // if the scanner failed
        func failed() {
            let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            captureSession = nil
        }
        //catch the metadata of the scanner
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            captureSession.stopRunning()

            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
               
                guard let stringValue = readableObject.stringValue else { return }
               AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                found(code: stringValue) {
                    self.performSegue(withIdentifier: "DetailsFromScanner", sender: nil)
                }
            }

        }
        // parse the metadata  into movie object
        func found(code: String , callback : @escaping ()->Void) {
            MoviesApi.fetchMovie(from: code) { [weak self] (movie, err) in
                guard let view = self?.view , let viewController = self else {return}
                viewController.showProgress(on: view)
                if let movie = movie {
                  
                           //  initialise a new  coreData Movie
                    viewController.movie = Movie(context: CoreDataContext.share)
                    viewController.movie?.convertMovie(from: movie)
                            
                            //try to save a Movie
                    do{try CoreDataContext.share.save()}catch{
                               //unwrap the view
                               
                        viewController.errorPKHUD(on: view)
                    
                           }
                    viewController.successPKHUD(on: view)
                    callback()
            
                    }
                 return
                }
                
            }
        // prepare for the  segue and send the movie object
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let target = segue.destination as? DetailsViewController {
                target.movie = movie
            }
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }

        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
        }

    }
