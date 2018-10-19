//
//  MoneyTabViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 18/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class MoneyTabCollectionViewController : UICollectionViewController
{
    let cellId = "cellId"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavBar()
    }
    
    private func setupNavBar()
    {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Market"
        titleLabel.textColor = .black

        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)

        navigationItem.titleView = titleLabel
        
        let searchNavButton = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearchNavButton))
        
        navigationItem.rightBarButtonItems = [searchNavButton]
        
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    @objc func handleSearchNavButton()
    {
        print("Search has not been implemented yet.")
    }
    
    
}

extension MoneyTabCollectionViewController
{
    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
}
