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
        
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
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

extension MoneyTabCollectionViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width - 32, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarketCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 20
    }
}
