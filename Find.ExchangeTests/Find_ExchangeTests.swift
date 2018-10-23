//
//  Find_ExchangeTests.swift
//  Find.ExchangeTests
//
//  Created by Sezer Tunca on 18/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import XCTest
@testable import Find_Exchange

class Find_ExchangeTests: XCTestCase
{
    var advertService : AdvertService?
    var adverts : [Advert]?

    override func setUp()
    {
        advertService = AdvertService.sharedInstance
    }

    func testExample()
    {
        advertService?.getAds
        {
            (ads) in
            self.adverts = ads
            XCTAssertNotNil(self.adverts)
        }
    }

    func testPerformanceExample()
    {
        self.measure
        {
        }
    }

}
