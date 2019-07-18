//
//  Loader.swift
//  TodoTDC-App
//
//  Created by Michel Anderson Lutz Teixeira on 14/07/19.
//

import Foundation
import UIKit

final class Loader: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setup()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.3)
    }
    
}
