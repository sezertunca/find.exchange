//
//  Extensions.swift
//  Find.Exchange
//
//  Created by Sezer Tunca on 19/10/2018.
//  Copyright © 2018 Sezer Tunca. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}


extension UIView
{
    public func addConstraintsWithFormat(_ format: String, views: UIView...)
    {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated()
        {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    public func fillSuperview()
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    public func anchor(top: NSLayoutYAxisAnchor? = nil,
                       left: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       right: NSLayoutXAxisAnchor? = nil,
                       topPadding: CGFloat = 0,
                       leftPadding: CGFloat = 0,
                       bottomPadding: CGFloat = 0,
                       rightPadding: CGFloat = 0,
                       width: CGFloat = 0,
                       height: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topPadding, leftConstant: leftPadding, bottomConstant: bottomPadding, rightConstant: rightPadding, widthConstant: width, heightConstant: height)
    }
    
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint]
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top
        {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left
        {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom
        {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right
        {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0
        {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0
        {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    public func anchorCenterXToSuperview(constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterYToSuperview(constant: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterSuperview()
    {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
}

extension UIColor
{
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat)
    {
        self.init(r: r, g: g, b: b, a: 1)
    }

    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)
    {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static let whiteish : UIColor =
    {
        return UIColor(r: 245, g: 245, b: 245)
    }()
}


extension UIFont
{
    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont
    {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont
    {
        return withTraits(traits: .traitItalic)
    }
}


extension UILabel
{
    func textDropShadow()
    {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    static func createCustomLabel() -> UILabel
    {
        let label = UILabel()
        label.textDropShadow()
        return label
    }
}

extension UIApplication
{
    var statusBarView: UIView?
    {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}


extension UITabBarController
{    
    private struct AssociatedKeys {
        // Declare a global var to produce a unique address as the assoc object handle
        static var orgFrameView:     UInt8 = 0
        static var movedFrameView:   UInt8 = 1
    }
    
    var orgFrameView:CGRect? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.orgFrameView) as? CGRect }
        set { objc_setAssociatedObject(self, &AssociatedKeys.orgFrameView, newValue, .OBJC_ASSOCIATION_COPY) }
    }
    
    var movedFrameView:CGRect? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.movedFrameView) as? CGRect }
        set { objc_setAssociatedObject(self, &AssociatedKeys.movedFrameView, newValue, .OBJC_ASSOCIATION_COPY) }
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let movedFrameView = movedFrameView {
            view.frame = movedFrameView
        }
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        //since iOS11 we have to set the background colour to the bar color it seams the navbar seams to get smaller during animation; this visually hides the top empty space...
        view.backgroundColor =  self.tabBar.barTintColor
        // bail if the current state matches the desired state
        if (tabBarIsVisible() == visible) { return }
        
        //we should show it
        if visible {
            tabBar.isHidden = false
            UIView.animate(withDuration: animated ? 0.3 : 0.0) {
                //restore form or frames
                self.view.frame = self.orgFrameView!
                //errase the stored locations so that...
                self.orgFrameView = nil
                self.movedFrameView = nil
                //...the layoutIfNeeded() does not move them again!
                self.view.layoutIfNeeded()
            }
        }
            //we should hide it
        else {
            //safe org positions
            orgFrameView   = view.frame
            // get a frame calculation ready
            let offsetY = self.tabBar.frame.size.height
            movedFrameView = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + offsetY)
            //animate
            UIView.animate(withDuration: animated ? 0.3 : 0.0, animations: {
                self.view.frame = self.movedFrameView!
                self.view.layoutIfNeeded()
            }) {
                (_) in
                self.tabBar.isHidden = true
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return orgFrameView == nil
    }
}


extension UITabBarController
{
    func hideTabBarAnimated(hide:Bool)
    {
        UIView.animate(withDuration: 0.3, animations: {
            if hide {
                self.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            } else {
                self.tabBar.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        })
    }
}

extension UINavigationController
{
    func hideTabBarAnimated(hide:Bool)
    {
        UIView.animate(withDuration: 0.3, animations: {
            if hide {
                self.navigationBar.transform = CGAffineTransform(translationX: 0, y: -80)
            } else {
                self.navigationBar.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        })
    }
}

extension Int
{
    func description() -> String
    {
        return "\(self)"
    }
}
