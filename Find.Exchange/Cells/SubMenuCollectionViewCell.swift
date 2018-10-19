//
//  SubMenuCollectionViewCell.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class SubMenuCollectionViewCell : BaseCollectionViewCell
{
    let label : UILabel =
    {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override func setupViews()
    {
        addSubview(label)
        label.anchor(top: topAnchor,
                     left: leftAnchor,
                     bottom: bottomAnchor,
                     right: rightAnchor,
                     topPadding: 0,
                     leftPadding: 0,
                     bottomPadding: 0,
                     rightPadding: 0,
                     width: 0,
                     height: 0)
        
        backgroundColor = UIColor(r: 248, g: 248, b: 248)
        
        layer.cornerRadius = Radius.subMenuItem
    }
    
    override var isSelected: Bool
    {
        didSet
        {
            if isSelected
            {
                backgroundColor = .black
                label.textColor = .white
            }
            else
            {
                backgroundColor = UIColor(r: 248, g: 248, b: 248)
                label.textColor = .black
            }
        }
    }
}
