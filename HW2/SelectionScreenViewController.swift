//
//  SelectionScreen.swift
//  HW2
//
//  Created by Eser Kucuker on 23.12.2021.
//

import UIKit
protocol baseViewControllerDelegete {
    func didTapChoice(name: String)
}
class SelectionScreenViewController: UIViewController{
    
    var SelectionDelegate : baseViewControllerDelegete!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func duneButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        SelectionDelegate.didTapChoice(name: "Dune")
        dismiss(animated: true, completion: nil)
    }

    @IBAction func witcherButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        SelectionDelegate.didTapChoice(name: "Witcher")
        dismiss(animated: true, completion: nil)
    }
}
