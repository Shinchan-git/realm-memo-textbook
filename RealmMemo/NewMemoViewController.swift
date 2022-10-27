//
//  NewMemoViewController.swift
//  RealmMemo
//
//  Created by Owner on 2022/10/26.
//

import UIKit

class NewMemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var toggleSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.returnKeyType = .done
        toggleSwitch.isOn = false
    }
    
    @IBAction func close() {
        let newMemo = Memo()
        newMemo.text = textField.text ?? ""
        newMemo.isMarked = toggleSwitch.isOn
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ViewController
        previousVC.addNew(memo: newMemo)
        
        self.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

}
