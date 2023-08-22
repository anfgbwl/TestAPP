//
//  UserDefaultsViewController.swift
//  TestAPP
//
//  Created by t2023-m0076 on 2023/08/22.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var saveTextField: UITextField!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var updateTextField: UITextField!
    @IBOutlet weak var deleteLabel: UILabel!
    
    @IBAction func saveButtonAction(_ sender: Any) {
        UserDefaults.standard.set(saveTextField.text, forKey: "name")
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        let search = UserDefaults.standard.string(forKey: "name")
        searchLabel.text = search
    }
    
    @IBAction func updateButtonAction(_ sender: Any) {
        UserDefaults.standard.set(updateTextField.text, forKey: "name")
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        let delete = UserDefaults.standard.removeObject(forKey: "name")
        deleteLabel.text = "delete"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
