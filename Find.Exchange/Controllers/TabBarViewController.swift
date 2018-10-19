//
//  TabBarViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 18/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class TabBarViewController : UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        let moneyTabCollectionViewController = MoneyTabCollectionViewController(collectionViewLayout: layout)
        let marketTabNavController = UINavigationController(rootViewController: moneyTabCollectionViewController)
        
        // withRenderingMode always original preserves the original colour
        marketTabNavController.tabBarItem.image = UIImage(named: "market")?.withRenderingMode(.alwaysOriginal)
        marketTabNavController.tabBarItem.selectedImage = UIImage(named: "market_active")?.withRenderingMode(.alwaysOriginal)
        
        let accountTabViewController = AccountsTabBarViewController()
        accountTabViewController.tabBarItem.image = UIImage(named: "accounts")?.withRenderingMode(.alwaysOriginal)
        accountTabViewController.tabBarItem.selectedImage = UIImage(named: "accounts")?.withRenderingMode(.alwaysTemplate)
        
        let cardTabViewController = CardTabBarViewController()
        cardTabViewController.tabBarItem.image = UIImage(named: "card")?.withRenderingMode(.alwaysOriginal)
        cardTabViewController.tabBarItem.selectedImage = UIImage(named: "card")?.withRenderingMode(.alwaysTemplate)
        
        let qrTabViewController = ScanQrTabBarController()
        qrTabViewController.tabBarItem.image = UIImage(named: "qr")?.withRenderingMode(.alwaysOriginal)
        qrTabViewController.tabBarItem.selectedImage = UIImage(named: "qr")?.withRenderingMode(.alwaysOriginal)
        
        let moreTabViewController = MoreTabBarViewController()
        moreTabViewController.tabBarItem.image = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        moreTabViewController.tabBarItem.selectedImage = UIImage(named: "more")?.withRenderingMode(.alwaysTemplate)
        
        viewControllers =
        [
            accountTabViewController,
            cardTabViewController,
            qrTabViewController,
            marketTabNavController,
            moreTabViewController
        ]
    }
}
