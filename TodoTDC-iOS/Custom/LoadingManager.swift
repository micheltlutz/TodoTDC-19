//
//  LoadingManager.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import Foundation
import UIKit

internal struct LoadingManager {
    
    static private var loader: UIActivityIndicatorView?
    
    internal static func show(_ loader: UIActivityIndicatorView, in viewController: UIViewController) {
        guard self.loader == nil else { return }
        self.loader = loader
        
        DispatchQueue.main.async {
            viewController.view.addSubview(loader)
            loader.startAnimating()
        }
    }
    
    internal static func hide() {
        guard let loader = loader else { return }
        
        DispatchQueue.main.async {
            loader.stopAnimating()
            self.loader?.removeFromSuperview()
        }
        
        self.loader = nil
    }
}
