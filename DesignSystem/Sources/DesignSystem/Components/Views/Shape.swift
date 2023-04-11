//
//  Shape.swift
//  
//
//  Created by Elen Souza on 11/04/23.
//

import UIKit

public final class Shape: UIView {
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    public var contentViewLeadingAnchor: NSLayoutXAxisAnchor {
        self.contentView.leadingAnchor
    }

    public var contentViewTopAnchor: NSLayoutYAxisAnchor {
        self.contentView.topAnchor
    }

    public var contentViewTrailingAnchor: NSLayoutXAxisAnchor {
        self.contentView.trailingAnchor
    }

    public var contentViewBottomAnchor: NSLayoutYAxisAnchor {
        self.contentView.bottomAnchor
    }

    public convenience init(borderWidht: Border,
                            borderColor: UIColor,
                            backgroundColor: UIColor,
                            edgesInset: Spacing) {
        self.init()
       
        layer.borderWidth = borderWidht.rawValue
        layer.borderColor = borderColor.cgColor
        
        self.backgroundColor = backgroundColor
        
        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Spacing.lg.rawValue),
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: Spacing.lg.rawValue),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Spacing.lg.rawValue),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Spacing.lg.rawValue)
        ])
    }

    public func addView(_ view: UIView) {
        contentView.addSubview(view)
    }
}
