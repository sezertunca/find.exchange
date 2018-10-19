//
//  MoneyTabViewController.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 18/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

class MoneyTabCollectionViewController : UICollectionViewController, SubMenuBarDelegate
{
    // Temp hard coded - This would normally be fetched from an API
    var adverts : [Advert] =
    {
        var currencySolutions = Advert(title: "PICK OF THE WEEK",
                         subTitle: "Your trusted provider for personal & business",
                         image: #imageLiteral(resourceName: "couple1"),
                         subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0.7),
                         provider: Provider(name: "Currency Solutions", logo: #imageLiteral(resourceName: "currency_solutions_logo")))
        
        var currencyFair = Advert(title: "You, him, she, her...",
                         subTitle: "Just go direct...",
                         image: #imageLiteral(resourceName: "couple2"),
                         subTitleBackgroundColor: UIColor.init(r: 186, g: 201, b: 212, a: 1),
                         provider: Provider(name: "Currency Fair", logo: #imageLiteral(resourceName: "currency_fair_logo")))
        
        var xendPay = Advert(title: "Become a XendPay",
                         subTitle: "",
                         image: #imageLiteral(resourceName: "girl"),
                         subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0),
                         provider: Provider(name: "Xend>Pay", logo: #imageLiteral(resourceName: "xendpay_logo")))
        
        var people = Advert(title: "",
                             subTitle: "",
                             image: #imageLiteral(resourceName: "people"),
                             subTitleBackgroundColor: UIColor.init(r: 3, g: 80, b: 147, a: 0),
                             provider: Provider(name: "", logo: nil))
        
        return [currencySolutions, currencyFair, xendPay, people]
    }()
    
    let cellId = "cellId"
    
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
        
        hidesBottomBarWhenPushed = true
        
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
                           bottomPadding: 110,
                           rightPadding: 45,
                           width: 0,
                           height: 40)
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
        
        UIApplication.shared.statusBarView?.backgroundColor = .whiteish
        
        navigationController?.navigationBar.isHidden = true
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
        subMenuBar.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          bottom: nil,
                          right: view.rightAnchor,
                          topPadding: 44,
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
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height))
        {
            UIView.animate(withDuration: 0.5, delay: 0, options:.transitionCurlDown, animations:
            {
                self.navigationController?.navigationBar.isHidden = true
                self.tabBarController?.tabBar.isHidden = true
            }, completion : nil)
        }
        
        if (scrollView.contentOffset.y < 0)
        {
            print("Reached top")
        }
        
        if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height))
        {
            UIView.animate(withDuration: 0.5, delay: 0, options:.transitionCurlDown, animations:
            {
//                self.navigationController?.navigationBar.isHidden = false
                self.tabBarController?.tabBar.isHidden = false
            }, completion : nil)
        }
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
        return adverts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MarketCollectionViewCell
        cell.advert = adverts[indexPath.item]
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
    
    func updateCompareButtonTitle(text: String)
    {
        let newTitle = "Compare \(text)"
        hoverButton.setTitle(newTitle, for: .normal)
    }
}
