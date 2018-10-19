//
//  SubMenuBar.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class SubMenuBar : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"
    
    let menuOptions = [
        "Money Transfer",
        "Insurance",
        "Credit",
        "Loans"
    ]
    
    lazy var collectionView : UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(r: 248, g: 248, b: 248)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(collectionView)
    
        collectionView.anchor(top: topAnchor,
                              left: leftAnchor,
                              bottom: bottomAnchor,
                              right: rightAnchor,
                              topPadding: 0,
                              leftPadding: 20,
                              bottomPadding: 0,
                              rightPadding: 20,
                              width: 0,
                              height: 0)
        
        collectionView.register(SubMenuCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SubMenuBar
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return menuOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SubMenuCollectionViewCell
        cell.label.text = menuOptions[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = (menuOptions[indexPath.item] as NSString).size(withAttributes: nil)
        return CGSize(width: size.width + 50, height: collectionView.frame.height / 2)
    }
}

