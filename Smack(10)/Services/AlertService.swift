//
//  AlertService.swift
//  Smack(10)
//
//  Created by Max Egorov on 11/21/19.
//  Copyright © 2019 Max Egorov. All rights reserved.
//

import UIKit

class AlertService: NSObject {
    static let instance = AlertService()

    func alert(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(defaultAction)
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true)
        })
    }

    private override init() {
    }

}
