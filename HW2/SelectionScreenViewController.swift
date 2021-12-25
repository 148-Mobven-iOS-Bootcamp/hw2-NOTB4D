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
    
    var makeMovieName = {(name : String) -> (String) in
        var name = name
        return name
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func duneButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        let movieName = makeMovieName("Dune")
        SelectionDelegate.didTapChoice(name: movieName)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func witcherButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        let movieName = makeMovieName("Witcher")
        SelectionDelegate.didTapChoice(name: movieName)
        dismiss(animated: true, completion: nil)
    }
}
