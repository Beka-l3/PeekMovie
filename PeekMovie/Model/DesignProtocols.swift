//
//  Statics.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 11.10.2022.
//

import UIKit


protocol Fonts {
    var body: UIFont {get}
    var title: UIFont {get}
    var headline: UIFont {get}
    var headlineBold: UIFont {get}
    var primaryInfo: UIFont {get}
    var infoFont: UIFont {get}
}

extension Fonts {
    var body: UIFont {UIFont.systemFont(ofSize: 20)}
    var title: UIFont {UIFont.systemFont(ofSize: 56)}
    var headline: UIFont {UIFont.systemFont(ofSize: 36)}
    var headlineBold: UIFont {UIFont.boldSystemFont(ofSize: 18)}
    var primaryInfo: UIFont {UIFont.systemFont(ofSize: 22)}
    var infoFont: UIFont {UIFont.systemFont(ofSize: 14)}
}

protocol Colors {
    var black: UIColor {get}
    var white: UIColor {get}
    var semiWhite: UIColor {get}
    var grey: UIColor {get}
    var yellow: UIColor {get}
}

extension Colors {
    var black: UIColor {UIColor(red: 0, green: 0, blue: 0, alpha: 1)}
    var white: UIColor {UIColor(red: 1, green: 1, blue: 1, alpha: 1)}
    var semiWhite: UIColor {UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)}
    var grey: UIColor {UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)}
    var yellow: UIColor {UIColor(red: 245.0/255.0, green: 250.0/255.0, blue: 25.0/255.0, alpha: 1)}
}
