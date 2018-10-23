//
//  AdvertDetailViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 23/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Hero

class AdvertDetailViewController : UIViewController
{
    var advert : Advert?
    {
        didSet
        {
            topImageView.hero.id = advert?.id.description
            
//            if let ad = advert
//            {
//                topImageView.hero.id = "\(ad.id.description) bgImage"
//                providerLogoImageView.hero.id = "\(ad.id.description) providerLogo"
//                providerNameLabel.hero.id = "\(ad.id.description) providerName"
//            }
            
            topImageView.image = advert?.image
            providerNameLabel.text = advert?.provider?.name
            providerLogoImageView.image = advert?.provider?.logo
        }
    }
    
    let scrollView : UIScrollView =
    {
        let view = UIScrollView()
        view.backgroundColor = .white
        return view
    }()
    
    let providerNameLabel : UILabel =
    {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let providerLogoImageView : UIImageView =
    {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    let topImageView : UIImageView =
    {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let exitButton : UIButton =
    {
       let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "exit").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        hero.isEnabled = true
        
        view.backgroundColor = .whiteish
        
        view.addSubview(topImageView)
        
        topImageView.anchor(top: view.topAnchor,
                            left: view.leftAnchor,
                            bottom: nil,
                            right: view.rightAnchor,
                            topPadding: 0,
                            leftPadding: 0,
                            bottomPadding: 0,
                            rightPadding: 0,
                            width: 0,
                            height: 300)
        
        
        view.addSubview(exitButton)
        
        exitButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topPadding: 20, leftPadding: 0, bottomPadding: 0, rightPadding: 20, width: 60, height: 60)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture)
        
        view.addSubview(scrollView)
        
        scrollView.anchor(top: topImageView.bottomAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor,
                          topPadding: 0,
                          leftPadding: 0,
                          bottomPadding: 0,
                          rightPadding: 0,
                          width: 0,
                          height: 0)
        
        
        scrollView.addSubview(providerLogoImageView)
        
        providerLogoImageView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topPadding: 10, leftPadding: 20, bottomPadding: 0, rightPadding: 0, width: 60, height: 60)
        
        scrollView.addSubview(providerNameLabel)
        
        providerNameLabel.anchor(top: providerLogoImageView.topAnchor, left: providerLogoImageView.rightAnchor, bottom: providerLogoImageView.bottomAnchor, right: scrollView.rightAnchor, topPadding: 0, leftPadding: 12, bottomPadding: 0, rightPadding: 0, width: 0, height: 0)
    }
    
    @objc func handleExit()
    {
        hero.dismissViewController()
        print("handling exit button")
    }
    
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer)
    {
        switch sender.state
        {
        case .began:
            hero.dismissViewController()
        default:
            print("Default state not handling")
        }
    }
    
}
