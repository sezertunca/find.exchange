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
        
        view.backgroundColor = AppGeneralTheme.viewControllerBackgroundColor
        
        let layout = UICollectionViewFlowLayout()
        let moneyTabCollectionViewController = MoneyTabCollectionViewController(collectionViewLayout: layout)
        let marketTabNavController = UINavigationController(rootViewController: moneyTabCollectionViewController)
        
        // withRenderingMode always original preserves the original colour
        marketTabNavController.tabBarItem.image = UIImage(named: "market")?.withRenderingMode(.alwaysOriginal)
        marketTabNavController.tabBarItem.selectedImage = UIImage(named: "market_active")?.withRenderingMode(.alwaysOriginal)
        marketTabNavController.tabBarItem.title = TabBarTitle.market
        marketTabNavController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        let accountTabViewController = AccountsTabBarViewController()
        accountTabViewController.tabBarItem.image = UIImage(named: "accounts")?.withRenderingMode(.alwaysOriginal)
        accountTabViewController.tabBarItem.selectedImage = UIImage(named: "accounts_active")?.withRenderingMode(.alwaysOriginal)
        accountTabViewController.tabBarItem.title = TabBarTitle.accounts
        accountTabViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        let cardTabViewController = CardTabBarViewController()
        cardTabViewController.tabBarItem.image = UIImage(named: "card")?.withRenderingMode(.alwaysOriginal)
        cardTabViewController.tabBarItem.selectedImage = UIImage(named: "card_active")?.withRenderingMode(.alwaysOriginal)
        cardTabViewController.tabBarItem.title = TabBarTitle.card
        cardTabViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        let qrTabViewController = ScanQrTabBarController()
        qrTabViewController.tabBarItem.image = UIImage(named: "qr")?.withRenderingMode(.alwaysOriginal)
        qrTabViewController.tabBarItem.selectedImage = UIImage(named: "qr_active")?.withRenderingMode(.alwaysOriginal)
        qrTabViewController.tabBarItem.title = TabBarTitle.scanQr
        qrTabViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
        let moreTabViewController = MoreTabBarViewController()
        moreTabViewController.tabBarItem.image = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        moreTabViewController.tabBarItem.selectedImage = UIImage(named: "more_active")?.withRenderingMode(.alwaysOriginal)
        moreTabViewController.tabBarItem.title = TabBarTitle.more
        moreTabViewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        
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
