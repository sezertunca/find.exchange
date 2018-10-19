//
//  Ad.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

struct Advert
{
    var image : UIImage
    var title : String
    var subTitle : String
    var subTitleBackgroundColor : UIColor?
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
