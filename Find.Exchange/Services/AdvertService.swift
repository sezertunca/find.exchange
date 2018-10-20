//
//  AdvertService.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 20/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

struct AdvertService
{
    // Singleton example
    static var sharedInstance : AdvertService =
    {
        var instance = AdvertService()
        return instance
    }()
    
    // Temp hard coded - This would normally be fetched from an API
    // Uses callback
    func getAds(completion: @escaping ([Advert]?) -> ())
    {
        let currencySolutions = Advert(title: "PICK OF THE WEEK",
                                       subTitle: "Your trusted provider for personal & business",
                                       image: #imageLiteral(resourceName: "couple1"),
                                       subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0.7),
                                       provider: Provider(name: "Currency Solutions", logo: #imageLiteral(resourceName: "currency_solutions_logo")))
        
        let currencyFair = Advert(title: "You, him, she, her...",
                                  subTitle: "Just go direct...",
                                  image: #imageLiteral(resourceName: "couple2"),
                                  subTitleBackgroundColor: UIColor.init(r: 186, g: 201, b: 212, a: 1),
                                  provider: Provider(name: "Currency Fair", logo: #imageLiteral(resourceName: "currency_fair_logo")))
        
        let xendPay = Advert(title: "Become a XendPay",
                             subTitle: "",
                             image: #imageLiteral(resourceName: "girl"),
                             subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0),
                             provider: Provider(name: "Xend>Pay", logo: #imageLiteral(resourceName: "xendpay_logo")))
        
        let people = Advert(title: "",
                            subTitle: "",
                            image: #imageLiteral(resourceName: "people"),
                            subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0),
                            provider: Provider(name: "", logo: nil))
        
        completion([currencySolutions, currencyFair, xendPay, people])
    }
}
