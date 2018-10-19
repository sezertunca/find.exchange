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
    
    let subMenuBar : SubMenuBar =
    {
        let view = SubMenuBar()
        return view
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(r: 248, g: 248, b: 248)
        
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavBar()
        
        setupSubMenuBar()
        
        collectionView.contentInset = UIEdgeInsets(top: 54, left: 0, bottom: 0, right: 0)
        
        collectionView.showsVerticalScrollIndicator = false
        
        self.extendedLayoutIncludesOpaqueBars = true;
    }
    
    private func setupNavBar()
    {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = " Market"
        titleLabel.textColor = .black

        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)

        navigationItem.titleView = titleLabel
        
        let searchNavButton = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearchNavButton))
        
        navigationItem.rightBarButtonItems = [searchNavButton]
        
        navigationController?.navigationBar.shouldRemoveShadow(true)
        
        navigationController?.navigationBar.barTintColor = UIColor(r: 248, g: 248, b: 248)
        
        navigationController?.navigationBar.isTranslucent = false
        
//        navigationController?.hidesBarsOnSwipe = true
    }
    
    private func setupSubMenuBar()
    {
        view.addSubview(subMenuBar)
        subMenuBar.backgroundColor = UIColor(r: 248, g: 248, b: 248)
        subMenuBar.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: view.rightAnchor,
                          topPadding: 88,
                          leftPadding: 0,
                          bottomPadding: 0,
                          rightPadding: 0,
                          width: 0,
                          height: 40)
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
        return 21
    }
}
