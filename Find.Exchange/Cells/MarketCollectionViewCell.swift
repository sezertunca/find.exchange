
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
    var advert : Advert?
    {
        didSet
        {
            backGroundImageView.image = advert?.image
            providerLogoImageView.image = advert?.provider?.logo
            providerNameLabel.text = advert?.provider?.name
            advertTitleLabel.text = advert?.title
            advertSubTitleLabel.text = advert?.subTitle
            
            if let bottomColor = advert?.subTitleBackgroundColor
            {
                bottomBackgroundView.backgroundColor = bottomColor
            }
        }
    }
    
    let providerLogoImageView : UIImageView =
    {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.image = #imageLiteral(resourceName: "currency_solutions_logo")
        return imageView
    }()
    
    let providerNameLabel : UILabel =
    {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: FontSize.subTitle, weight: .bold)
        label.numberOfLines = 2
        label.textDropShadow()
        return label
    }()
    
    let advertTitleLabel : UILabel =
    {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .bold)
        label.numberOfLines = 0
        label.textDropShadow()
        return label
    }()
    
    let advertSubTitleLabel : UILabel =
    {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: FontSize.footnote, weight: .bold)
        label.numberOfLines = 0
        label.textDropShadow()
        return label
    }()
    
    let bottomBackgroundView : UIView =
    {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Radius.appGeneral
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    let hoverButton : UIButton =
    {
       let button = UIButton(type: .system)
        button.setTitle("Go Transfer", for: .normal)
        let font = UIFont.systemFont(ofSize: FontSize.body, weight: .bold).italic()
        button.titleLabel?.font = font
        button.backgroundColor = .white
        button.setTitleColor(UIColor.init(r: 38, g: 158, b: 218), for: .normal)
        button.layer.cornerRadius = Radius.appGeneral
        button.addTarget(self, action: #selector(handeHoverButton), for: .touchUpInside)
        return button
    }()
    
    let backGroundImageView : UIImageView =
    {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Radius.appGeneral
        return imageView
    }()
    
    override func setupViews()
    {
        layer.cornerRadius = Radius.appGeneral
        
        clipsToBounds = true
        layer.masksToBounds = true
        
        layer.shadowOffset = CGSize(width: 1, height: 0);
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5;
        layer.shadowOpacity = 0.25;
        
        addSubViews()
    }
    
    private func addSubViews()
    {
        addSubview(backGroundImageView)
        
        backGroundImageView.anchor(top: topAnchor,
                                   left: leftAnchor,
                                   bottom: bottomAnchor,
                                   right: rightAnchor,
                                   topPadding: 5,
                                   leftPadding: 5,
                                   bottomPadding: 5,
                                   rightPadding: 5,
                                   width: 0,
                                   height: 0)
        
        addSubview(providerLogoImageView)
        
        providerLogoImageView.anchor(top: topAnchor,
                                     left: leftAnchor,
                                     bottom: nil,
                                     right: nil,
                                     topPadding: 20,
                                     leftPadding: 25,
                                     bottomPadding: 0,
                                     rightPadding: 0,
                                     width: 60,
                                     height: 60)
        
        addSubview(providerNameLabel)
        
        providerNameLabel.anchor(top: providerLogoImageView.topAnchor,
                                 left: providerLogoImageView.rightAnchor,
                                 bottom: providerLogoImageView.bottomAnchor,
                                 right: nil,
                                 topPadding: 0,
                                 leftPadding: 15,
                                 bottomPadding: 0,
                                 rightPadding: 15,
                                 width: 120,
                                 height: 0)
        
        addSubview(advertTitleLabel)
        
        advertTitleLabel.anchor(top: nil,
                                left: leftAnchor,
                                bottom: nil,
                                right: nil,
                                topPadding: 0,
                                leftPadding: 23,
                                bottomPadding: 0,
                                rightPadding: 0,
                                width: 115,
                                height: 200)
        
        advertTitleLabel.anchorCenterYToSuperview()

        addSubview(bottomBackgroundView)
        
        bottomBackgroundView.anchor(top: nil,
                                    left: leftAnchor,
                                    bottom: bottomAnchor,
                                    right: rightAnchor,
                                    topPadding: 5,
                                    leftPadding: 5,
                                    bottomPadding:5,
                                    rightPadding: 5,
                                    width: 0,
                                    height: 80)
        
        addSubview(advertSubTitleLabel)
        
        addSubview(hoverButton)
        
        hoverButton.anchor(top: nil,
                           left: nil,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           topPadding: 0,
                           leftPadding: 0,
                           bottomPadding: 25,
                           rightPadding: 20,
                           width: frame.width / 3,
                           height: 40)
        
        advertSubTitleLabel.anchor(top: nil,
                                   left: leftAnchor,
                                   bottom: bottomAnchor,
                                   right: hoverButton.leftAnchor,
                                   topPadding: 0,
                                   leftPadding: 20,
                                   bottomPadding: 28,
                                   rightPadding: 30,
                                   width: 0,
                                   height: 0)
    }
    
    
    // MARK: Handlers
    @objc func handeHoverButton()
    {
        print("Not implemented yet.")
    }
}
