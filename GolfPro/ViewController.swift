//
//  ViewController.swift
//  GolfPro
//
//  Created by tsthcmusit on 10/23/18.
//  Copyright © 2018 tsthcmusit. All rights reserved.
//

import UIKit
import BATabBarController

enum BATabBarType: Int {
    case withText
    case noText
}

class ViewController: UIViewController, BATabBarControllerDelegate {
    
    var firstTime = true
    var tabBarType: BATabBarType = .noText
    var viewController: BATabBarController = BATabBarController.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if firstTime {
            var feedTabBarItem, settingsTabBarItem, profileTabBarItem: BATabBarItem
            var feedViewController, settingsViewController, profileViewController: UIViewController
            
            feedViewController = UIViewController.init()
            settingsViewController = UIViewController.init()
            profileViewController = UIViewController.init()
            
            feedViewController.view.backgroundColor = UIColor.init(hex: 0x222B30)
            settingsViewController.view.backgroundColor = UIColor.init(hex: 0x222B30)
            profileViewController.view.backgroundColor = UIColor.init(hex: 0x222B30)
            
            switch tabBarType {
            case .withText:
                let feedOption = NSMutableAttributedString.init(string: "Feed")
                let settingsOption = NSMutableAttributedString.init(string: "Settings")
                let profileOption = NSMutableAttributedString.init(string: "Profile")
                
                feedOption.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: 0xF0F2F6), range: NSMakeRange(0, feedOption.length))
                settingsOption.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: 0xF0F2F6), range: NSMakeRange(0, settingsOption.length))
                profileOption.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.init(hex: 0xF0F2F6), range: NSMakeRange(0, profileOption.length))
                
                feedTabBarItem = BATabBarItem.init(image: UIImage.init(named: "FeedUnselected"), selectedImage: UIImage.init(named: "FeedSelected"), title: feedOption)
                settingsTabBarItem = BATabBarItem.init(image: UIImage.init(named: "SettingsUnselected"), selectedImage: UIImage.init(named: "SettingsSelected"), title: settingsOption)
                profileTabBarItem = BATabBarItem.init(image: UIImage.init(named: "ProfileUnselected"), selectedImage: UIImage.init(named: "ProfileSelected"), title: profileOption)
                
                let feedBadge: BATabBarBadge = BATabBarBadge.init(value: NSNumber.init(value: 1991), backgroundColor: UIColor.red)
                feedTabBarItem.badge = feedBadge
            case .noText:
                feedTabBarItem = BATabBarItem.init(image: UIImage.init(named: "FeedUnselected"), selectedImage: UIImage.init(named: "FeedSelected"))
                settingsTabBarItem = BATabBarItem.init(image: UIImage.init(named: "SettingsUnselected"), selectedImage: UIImage.init(named: "SettingsSelected"))
                profileTabBarItem = BATabBarItem.init(image: UIImage.init(named: "ProfileUnselected"), selectedImage: UIImage.init(named: "ProfileSelected"))
                
                let feedBadge = BATabBarBadge.init(value: NSNumber.init(value: 24), backgroundColor: UIColor.red)
                let settingsBadge = BATabBarBadge.init(value: NSNumber.init(value: 11), backgroundColor: UIColor.red)
                let profileBadge = BATabBarBadge.init(value: NSNumber.init(value: 1991), backgroundColor: UIColor.red)
                
                feedTabBarItem.badge = feedBadge
                settingsTabBarItem.badge = settingsBadge
                profileTabBarItem.badge = profileBadge
            }
            
            viewController = BATabBarController.init()
            viewController.viewControllers = NSArray.init(objects: feedViewController, settingsViewController, profileViewController) as? [UIViewController]
            viewController.tabBarItems = (NSArray.init(objects: feedTabBarItem, settingsTabBarItem, profileTabBarItem) as! [BATabBarItem])
            viewController.setSelectedView(settingsViewController, animated: false)
            
            viewController.delegate = self
            view.addSubview(viewController.view)
            firstTime = false
        }
    }
    
    // MARK: BATabBarControllerDelegate
    func tabBarController(_ tabBarController: BATabBarController!, didSelect viewController: UIViewController!) {
        print("Halo")
    }
    
}



