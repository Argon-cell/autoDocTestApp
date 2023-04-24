//
//  UIViewController.swift
//  autodocTestApp
//
//  Created by Ильгам Нафиков on 22.04.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
