//
//  ProfileVC.swift
//  Smack(10)
//
//  Created by Max Egorov on 11/18/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
      
    }

    @IBAction func closeModalBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTuch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_recognizer:)))
        bgView.addGestureRecognizer(closeTuch)
    }
    
    @objc func closeTap(_recognizer:UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
