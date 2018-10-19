
//
//  MarketCollectionViewCell.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class MarketCollectionViewCell : BaseCollectionViewCell
{
    override func setupViews()
    {
        backgroundColor = .lightGray
        layer.cornerRadius = 12
        
        clipsToBounds = false
        layer.masksToBounds = false
        
        layer.shadowOffset = CGSize(width: 1, height: 0);
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5;
        layer.shadowOpacity = 0.25;
    }
}
