//
//  Statics.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 11.10.2022.
//

import UIKit


protocol Fonts {
    var detailFont: UIFont {get}
    var detailBoldFont: UIFont {get}
    var descriptionFont: UIFont {get}
    var tipFont: UIFont {get}
    var bodyFont: UIFont {get}
    var headerFont: UIFont {get}
    var titleFont: UIFont {get}
    var largeTitleFont: UIFont {get}
}

extension Fonts {
    var detailFont: UIFont {UIFont.systemFont(ofSize: 14)}
    var detailBoldFont: UIFont {UIFont.boldSystemFont(ofSize: 14)}
    var descriptionFont: UIFont {UIFont.systemFont(ofSize: 16)}
    var tipFont: UIFont {UIFont.boldSystemFont(ofSize: 18)}
    var bodyFont: UIFont {UIFont.systemFont(ofSize: 20)}
    var headerFont: UIFont { UIFont.boldSystemFont(ofSize: 24) }
    var titleFont: UIFont {UIFont.systemFont(ofSize: 32)}
    var largeTitleFont: UIFont {UIFont.systemFont(ofSize: 56)}
}

protocol Colors {
    var black: UIColor {get}
    var semiBlack: UIColor {get}
    var clearBlack: UIColor {get}
    
    var white: UIColor {get}
    var semiWhite: UIColor {get}
    var clearWhite: UIColor {get}
    
    var grey: UIColor {get}
    var semiGrey: UIColor {get}
    var darkGrey: UIColor {get}
    
    var yellow: UIColor {get}
    var semiYellow: UIColor {get}
    var clearYellow: UIColor {get}
}

extension Colors {
    var black: UIColor {UIColor(red: 0, green: 0, blue: 0, alpha: 1)}
    var semiBlack: UIColor {UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)}
    var clearBlack: UIColor {UIColor(red: 0, green: 0, blue: 0, alpha: 0)}
    
    var white: UIColor {UIColor(red: 1, green: 1, blue: 1, alpha: 1)}
    var semiWhite: UIColor {UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)}
    var clearWhite: UIColor {UIColor(red: 1, green: 1, blue: 1, alpha: 0)}
    
    var grey: UIColor {UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)}
    var semiGrey: UIColor {UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)}
    var darkGrey: UIColor {UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)}
    
    var yellow: UIColor {UIColor(red: 245.0/255.0, green: 250.0/255.0, blue: 25.0/255.0, alpha: 1)}
    var semiYellow: UIColor {UIColor(red: 245.0/255.0, green: 250.0/255.0, blue: 25.0/255.0, alpha: 0.5)}
    var clearYellow: UIColor {UIColor(red: 245.0/255.0, green: 250.0/255.0, blue: 25.0/255.0, alpha: 0)}
}
