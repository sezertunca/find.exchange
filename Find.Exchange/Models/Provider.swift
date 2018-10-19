//
//  Provider.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

struct Provider
{
    var name : String
    var logo : UIImage?
    
    init(name: String, logo: UIImage?)
    {
        self.name = name
        self.logo = logo
    }
}
