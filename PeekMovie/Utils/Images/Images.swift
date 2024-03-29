//
//  Images.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


enum Images {
    
}


extension Images {
    enum Logo {
        
    }
    
    enum Icon {
        
    }
    
    enum Static {
        
    }
}


extension Images.Logo {
    enum App {
        static let x90 = UIImage(named: "App x90")
        static let x90png = UIImage(named: "App x90 png")
        static let x1024 = UIImage(named: "App x1024")
    }
}

extension Images.Icon {
    enum Email {
        static let x24 = UIImage(named: "Email icon x24")
    }
    
    enum Key {
        static let x24 = UIImage(named: "Key icon x24")
    }
    
    enum Profile {
        static let x24 = UIImage(named: "Profile icon x24")
    }
    
    enum MovieRoom {
        static let x24 = UIImage(named: "Movie Room x24")
    }
}

extension Images.Static {
    enum EntranceBackground {
        static let normal = UIImage(named: "Entarnce Background Image")
        static let unsaturated = UIImage(named: "Entarnce Background Image BW")
    }
}
