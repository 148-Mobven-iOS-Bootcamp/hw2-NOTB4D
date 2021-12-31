//
//  SelectionScreen.swift
//  HW2
//
//  Created by Eser Kucuker on 23.12.2021.
//

import UIKit

protocol BaseViewControllerDelegete: AnyObject {
    func didTapChoice(name: String)
}

class SelectionScreenViewController: UIViewController{
    
    weak var selectionDelegate : BaseViewControllerDelegete?
    typealias directorNameHandler = ([String:Any]) -> Void
    
    var directorName: directorNameHandler?
    
    var makeMovieName = {(name : String) -> (String) in
        var name = name
        return name
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func duneButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue:  nameKeys.darkNotificationKey.rawValue)
                    NotificationCenter.default.post(name: name, object: nil)
        
        let movieName = makeMovieName("Dune")
                    selectionDelegate?.didTapChoice(name: movieName)
        
        let director = ["director":"Denis Villeneuve"]
        guard let filmDirectorName = directorName else {return}
        filmDirectorName(director)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func witcherButtonTapped(_ sender: UIButton) {
        let name = Notification.Name(rawValue: nameKeys.lightNotificationKey.rawValue)
                    NotificationCenter.default.post(name: name, object: nil)
        
        let movieName = makeMovieName("Witcher")
                    selectionDelegate?.didTapChoice(name: movieName)
        
        let director = ["director":"Laure Schmidt"]
        guard let filmDirectorName = directorName else {return}
        filmDirectorName(director)
        dismiss(animated: true, completion: nil)
    }
}
