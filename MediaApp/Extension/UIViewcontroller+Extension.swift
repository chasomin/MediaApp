//
//  UIViewcontroller+Extension.swift
//  MediaApp
//
//  Created by 차소민 on 2/8/24.
//

import UIKit
import Toast

extension UIViewController {
    func showToast(text: String) {
        var style = ToastStyle()
        style.backgroundColor = .white
        style.messageColor = .black
        self.view.makeToast(text, duration: 2, position: .top, style: style)
    }
    
    
}
