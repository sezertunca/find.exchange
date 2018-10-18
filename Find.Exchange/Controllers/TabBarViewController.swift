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
        let navController = UINavigationController(rootViewController: moneyTabCollectionViewController)
        
        viewControllers = [navController]
    }
}
