//
//  BaseCell.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class BaseCollectionViewCell : UICollectionViewCell
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()
    {
    }
}


