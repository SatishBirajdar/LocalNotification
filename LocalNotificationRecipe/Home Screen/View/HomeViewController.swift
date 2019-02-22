//
//  ViewController.swift
//  LocalNotificationRecipe
//
//  Created by satish birajdar on 2019-02-21.
//  Copyright © 2019 SBSoftwares. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var SendNotificationButton: UIButton!
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = HomePresenter(delegate: self)
        presenter?.registerCustomNotification()

        // View reacting on app's transition from 'Background' to 'Foreground'
        NotificationCenter.default.addObserver(self, selector: #selector(resetView), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func resetView(){
         StatusLabel.text = ""
    }

    @IBAction func sendNotificationClicked(_ sender: Any) {
        presenter?.sendNotificationClicked()
    }
}

extension HomeViewController: HomePresenterDelegate {
    func updateStatus(message: String) {
        StatusLabel.text = message
    }
}
