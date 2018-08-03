//
//  AppConfig.swift
//  taipei-tourist-site-swift
//
//  Created by Jason Tsai on 2018/7/28.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import UIKit

public struct AppColor {
    public static let themeBlue = UIColor(hexString: "64C0E8")
    public static let mainOrange = UIColor(hexString: "FFA65C")
    public static let backgroundOrange = UIColor(hexString: "FFB77A")
    public static let lightBackgroundColor = UIColor(hexString: "FFF0E2")
    public static let textColor = UIColor(hexString: "979797")
    public static let darkTextColor = UIColor(hexString: "956135")
    public static let countdownShadowLayerColor = UIColor(hexString: "F6A623")
    public static let countdownLayerColor = UIColor(hexString: "FFD0A9")
}

public struct AppConfig {
    static func UnitFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
    
    static func UnitBoldFont(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    
    static func setNavigationBarThemeDefault(_ nav: UINavigationController) {
        //        self.navigationController?.navigationBar.topItem?.title = " "
        nav.navigationBar.isTranslucent = true
        nav.navigationBar.barTintColor = AppColor.themeBlue
        nav.navigationBar.tintColor = .white
        nav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UnitFont(18)]
    }
    
    static func setNavigationBarThemeDark(_ nav: UINavigationController) {
        self.setNavigationBarThemeDefault(nav)
        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav.navigationBar.shadowImage = UIImage()
    }
}

extension AppDelegate {
    func appStart() {
        UINavigationBar.appearance().isTranslucent = false
        
        let homeVC = HomeViewController()
        let naviVC = UINavigationController(rootViewController: homeVC)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = naviVC
        self.window?.makeKeyAndVisible()
    }
}
