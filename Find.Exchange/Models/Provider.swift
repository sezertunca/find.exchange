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
    // Name of the provider
    var name : String
    // Logo of the provider
    var logo : UIImage?
    
    init(name: String, logo: UIImage?)
    {
        self.name = name
        self.logo = logo
    }
}
