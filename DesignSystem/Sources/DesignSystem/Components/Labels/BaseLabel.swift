//
//  BaseLabel.swift
//  
//
//  Created by Elen Souza on 11/04/23.
//

import Foundation
import UIKit
 
public enum LabelStyle {
    case headingSmall
    case subtitleSmall
    case paragraph
}

public final class BaseLabel: UILabel {
    var labelStyle: LabelStyle {
        didSet {
            setConfig()
        }
    }
    
    @available(*, unavailable)
    public override init(frame: CGRect) {
        labelStyle = .headingSmall
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    public convenience init(text: String, style: LabelStyle) {
        self.init()
        
        labelStyle = style
        self.text = text
        self.numberOfLines = 0

        setConfig()
    }
    
    private func setConfig() {
        let attributedString = NSMutableAttributedString(string: self.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        switch self.labelStyle {
        case .headingSmall:
            font = UIFont(size: .lg, weight: .bold)
            textColor = NeutralColors.color5
            paragraphStyle.lineSpacing = font.pointSize / Line.distant
        case .subtitleSmall:
            font = UIFont(size: .md, weight: .medium)
            textColor = NeutralColors.color4
            paragraphStyle.lineSpacing = font.pointSize / Line.medium
        case .paragraph:
            font = UIFont(size: .xs, weight: .regular)
            textColor = NeutralColors.color4
            paragraphStyle.lineSpacing = font.pointSize / Line.distant
        }
        
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: self.text?.count ?? 0))
        self.attributedText = attributedString
    }
}
