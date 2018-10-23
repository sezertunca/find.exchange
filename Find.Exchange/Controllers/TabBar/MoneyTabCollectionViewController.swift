//
//  MoneyTabViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 18/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit
import Hero

class MoneyTabCollectionViewController : UICollectionViewController, SubMenuBarDelegate
{
    var firstTimeLoad = true
    let cellId = "cellId"
    var advertService : AdvertService?
    var ads = [Advert]()
    
    let id = 1;
    
    let subMenuBar : SubMenuBar =
    {
        let view = SubMenuBar()
        return view
    }()
    
    let hoverButton : UIButton =
    {
       let button = UIButton(type: .system)
        button.setTitle("Compare Money Transfer", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.body, weight: .bold)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = Radius.marketTabHoverButton
        button.addTarget(self, action: #selector(handleCompareButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        hero.isEnabled = true
            
        collectionView.backgroundColor = .whiteish
        
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavBar()
        
        setupSubMenuBar()
        
        collectionView.contentInset = UIEdgeInsets(top: 54, left: 0, bottom: 0, right: 0)

        
        collectionView.showsVerticalScrollIndicator = false
        
        self.extendedLayoutIncludesOpaqueBars = true;
        
        view.addSubview(hoverButton)
        
        hoverButton.anchor(top: nil,
                           left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           topPadding: 0,
                           leftPadding: 45,
                           bottomPadding: view.frame.height / 7,
                           rightPadding: 45,
                           width: 0,
                           height: 40)
        
        collectionView.contentOffset.x = 0

        advertService = AdvertService.sharedInstance
        
        getAdverts()
        
        collectionView.reloadData()
    }

    private func getAdverts()
    {
        // Get Ads using callback as an API should usually expect a callback
        advertService?.getAds
        {
            (adverts) in
            if let ads = adverts
            {
                self.ads = ads
            }
        }
    }
    
    private func setupNavBar()
    {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = " Market"
        titleLabel.textColor = .black

        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: FontSize.navTitleSize)

        navigationItem.titleView = titleLabel
        
        let searchNavButton = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearchNavButton))
        
        navigationItem.rightBarButtonItems = [searchNavButton]
        
        navigationController?.navigationBar.shouldRemoveShadow(true)
        
        navigationController?.navigationBar.barTintColor = .whiteish
        
        navigationController?.navigationBar.isTranslucent = false
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.whiteish
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .default
    }

    private func setupSubMenuBar()
    {
        view.addSubview(subMenuBar)
        subMenuBar.backgroundColor = .whiteish
        subMenuBar.delegate = self
        subMenuBar.accessibilityTraits = .button
        subMenuBar.accessibilityActivate()
        
        subMenuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: view.rightAnchor,
                          topPadding: 0,
                          leftPadding: 0,
                          bottomPadding: 0,
                          rightPadding: 0,
                          width: 0,
                          height: 60)

    }
    
    //MARK: - Handlers
    @objc func handleSearchNavButton()
    {
        print("Search has not been implemented yet.")
    }
    
    @objc func handleCompareButton()
    {
        print("Compare has not been implemented yet.")
    }
    
    // Prevent animations on load
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        firstTimeLoad = false
    }
    

    override func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if (!firstTimeLoad)
        {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height))
            {
                hideNavAndTabBar()
            }


            if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height))
            {
                showNavAndTabBar()
            }
        }
    }
    
    private func hideNavAndTabBar()
    {
        self.tabBarController?.hideTabBarAnimated(hide: true)
        self.navigationController?.hideTabBarAnimated(hide: true)
        moveSubMenuUp()
    }
    
    private func showNavAndTabBar()
    {
        self.tabBarController?.hideTabBarAnimated(hide: false)
        self.navigationController?.hideTabBarAnimated(hide: false)
        moveSubMenuDown()
    }
    
    private func moveSubMenuUp()
    {
        UIView.animate(withDuration: 0.2, animations:
        {
            self.subMenuBar.transform = CGAffineTransform(translationX: 0, y: -50)
            self.hoverButton.transform = CGAffineTransform(translationX: 0, y: 80)
        })
    }
    
    private func moveSubMenuDown()
    {
        UIView.animate(withDuration: 0.35, animations:
        {
            self.subMenuBar.transform = CGAffineTransform(translationX: 0, y: 0)
            self.hoverButton.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }

}

extension MoneyTabCollectionViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width - 32, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return ads.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarketCollectionViewCell
        cell.advert = ads[indexPath.item]
        if (indexPath.item == 1) {
            cell.providerNameLabel.textColor = .black
            cell.advertTitleLabel.textColor = .black
            cell.advertSubTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            cell.advertSubTitleLabel.textColor = UIColor.init(r: 48, g: 48, b: 48)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let detailViewController = AdvertDetailViewController()
        let ad = ads[indexPath.item]
        detailViewController.advert = ad
        navigationController?.present(detailViewController, animated: true, completion: nil)
    }
    
    func updateCompareButtonTitle(text: String)
    {
        let newTitle = "Compare \(text)"
        hoverButton.setTitle(newTitle, for: .normal)
    }
}
