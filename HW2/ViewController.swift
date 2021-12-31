//
//  ViewController.swift
//  HW2
//
//  Created by Eser Kucuker on 23.12.2021.
//

import UIKit






class ViewController: UIViewController {
    

    @IBOutlet weak private var chooseButton: UIButton!
    @IBOutlet weak private var mainImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var directorName: UILabel!
    
    // notification namlerini atama
    let light = Notification.Name(rawValue: nameKeys.lightNotificationKey.rawValue)
    let dark = Notification.Name(rawValue: nameKeys.darkNotificationKey.rawValue)

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
        
    }
    
    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(
            withIdentifier: "SelectionScreenViewController") as!
        SelectionScreenViewController
        // delegate ile filmim adını alıp Label'a yazdırıyoruz
        selectionVC.selectionDelegate = self
        // closure dan gelen verileri Label a basıyoruz
        selectionVC.directorName = { director in
            self.directorName.text = director["director"] as? String
        }

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
 
extension ViewController : BaseViewControllerDelegete{
    func didTapChoice(name: String){
        nameLabel.text = name
    }
}
