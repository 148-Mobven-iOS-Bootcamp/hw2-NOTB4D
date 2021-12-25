//
//  ViewController.swift
//  HW2
//
//  Created by Eser Kucuker on 23.12.2021.
//

import UIKit


//notification nameleri hazırlık
let lightNotificationKey = "lightSide"
let darkNotificationKey = "darkSide"


class ViewController: UIViewController {

    @IBOutlet weak var ChooseButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // notification namlerini atama
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createObservers()
        
    }
    
    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreenViewController") as!
        SelectionScreenViewController
        // delegate ile filmim adını alıp Label'a yazdırıyoruz
        selectionVC.SelectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
    func createObservers() {
        // Notificationlara observe olduğunda yapılıcak işlemler
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: light, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: dark, object: nil)
    }
    // hangi film secildi
    @objc func updateCharacterImage(notification: NSNotification) {
        
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "witcher")! : UIImage(named: "Dune")!
        mainImageView.image = image
    }
    
    // hangi arkaplan secildi
    @objc func updateBackground(notification: NSNotification) {
        
        let isLight = notification.name == light
        let color = isLight ? UIColor.gray : UIColor.red
        view.backgroundColor = color
    }

}
 
extension ViewController : baseViewControllerDelegete{
    func didTapChoice(name: String){
        nameLabel.text = name
    }
}
