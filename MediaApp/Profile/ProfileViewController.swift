//
//  ProfileViewController.swift
//  MediaApp
//
//  Created by 차소민 on 2/7/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let mainView = ProfileView()
    
    let navigationTitle: [String] = ["이름", "닉네임", "성별", "소개"]
    
    var userInput = [0: "", 1: "", 2: "", 3: ""]
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "프로필 편집"
        navigationItem.backButtonDisplayMode = .minimal

        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        mainView.tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.id)
        
        mainView.tapGesture.addTarget(self, action: #selector(tapGestureTapped))

    }

    @objc func tapGestureTapped() {
        print("===")
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.id) as? ProfileTableViewCell else {
            print("빈 셀")
            return UITableViewCell()
        }
        
        cell.textField.placeholder = navigationTitle[indexPath.row]
        cell.titleLabel.text = navigationTitle[indexPath.row]
        
        
        cell.accessoryType = .disclosureIndicator
        
        cell.textField.text = userInput[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = EditViewController()
        
        vc.navigationItem.title = navigationTitle[indexPath.row]
        vc.mainView.textField.placeholder = navigationTitle[indexPath.row]
        vc.mainView.descriptionLabel.text = navigationTitle[indexPath.row]


        vc.mainView.textField.text = userInput[indexPath.row]
        vc.userInputText = { value in
            self.userInput.updateValue(value, forKey: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }

        navigationController?.pushViewController(vc, animated: true)
        
    }
}
