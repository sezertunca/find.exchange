//
//  ScanQrTabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class ScanQrTabBarController : UIViewController
{
    let label : UILabel =
    {
        let label = UILabel()
        label.text = "Coming Soon"
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .bold)
        return label
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = AppGeneralTheme.viewControllerBackgroundColor
        
        view.addSubview(label)
        
        label.anchorCenterXToSuperview()
        label.anchorCenterYToSuperview()
        
        navigationController?.navigationBar.isHidden = false
    }
}
