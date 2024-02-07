//
//  EditViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit

final class EditViewController: UIViewController {
    
    let mainView = EditView()
    
    var userInputText: ((String) -> Void)?

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(mainView.textField.text!)
        userInputText?(mainView.textField.text!)
        
    }
    


}
