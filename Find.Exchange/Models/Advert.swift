//
//  Ad.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

// Used to display in MoneyTabController Cell
struct Advert
{
    var image : UIImage
    var title : String
    var subTitle : String
    
    var subTitleBackgroundColor : UIColor?
    
    // Provider details to show on the advert
    // Optional as we can have a cell without provider for marketing reasons
    var provider : Provider?
    
    init(title: String,
         subTitle: String,
         image: UIImage,
         subTitleBackgroundColor: UIColor?,
         provider : Provider?)
    {
        self.title = title
        self.subTitle = subTitle
        self.image = image
        self.subTitleBackgroundColor = subTitleBackgroundColor
        self.provider = provider
    }
}
