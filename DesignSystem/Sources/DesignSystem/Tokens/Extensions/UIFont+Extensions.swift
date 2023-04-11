//
//  UIFont+Extensions.swift
//
//
//  Created by Elen Souza on 09/04/23.
//

import UIKit

public extension UIFont {
    convenience init?(size: FontSize,
                      weight: FontWeight = .regular,
                      family: FontFamily = .name) {
        var weightValue: UIFont.Weight

        switch weight {
        case .regular:
            weightValue = .regular
        case .bold:
            weightValue = .bold
        case .medium:
            weightValue = .medium
        }

        let descriptor = UIFontDescriptor(fontAttributes: [.family: family.rawValue,
                                                           .traits: [UIFontDescriptor.TraitKey.weight: weightValue]])

        self.init(descriptor: descriptor, size: size.rawValue)
    }
    
    static func registerFonts() {
        FontWeight.allCases.forEach {
            Self.registerFont(named: "\(FontFamily.name.rawValue)-\($0.rawValue)")
        }
    }
}

private extension UIFont {
    static func registerFont(named fontName: String) {
        guard let fontURL = Bundle.module.url(forResource: fontName, withExtension: "ttf") else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            return print("Error registering font: maybe it was already registered.")
        }
    }
}
