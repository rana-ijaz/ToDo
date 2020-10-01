//
//  LoginVC.swift
//  ToDoApp
//
//  Created by Ijaz on 01/10/2020.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var fbLoginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRoundCorners()
    }
    
    func setupRoundCorners(){
        googleLoginBtn.layer.cornerRadius = 10.0
        googleLoginBtn.layer.masksToBounds = true
        
        fbLoginBtn.layer.cornerRadius = 10.0
        fbLoginBtn.layer.masksToBounds = true
    }

    // MARK: - IBAction methods
    @IBAction func skipBtnClicked(_ sender: Any){
        self.appDelegate.setRootVC()
    }
}

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
