//
//  CardContent.swift
//  
//
//  Created by Elen Souza on 11/04/23.
//

import UIKit

public final class CardContent: UIView {
    
    private let shape = Shape(borderWidht: .thin,
                              borderColor: NeutralColors.color2,
                              backgroundColor: NeutralColors.color1,
                              edgesInset: .sm)
    
    private let heading = BaseLabel(text: "Heading SM", style: .headingSmall)
    private let subtitle = BaseLabel(text: "Subtitle SM", style: .subtitleSmall)
    private let paragraph = BaseLabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", style: .paragraph)
    
    private let button = PrimaryButton(title: "Button Label", edgesInset: .xs)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarch()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarch() {
        shape.addView(heading)
        shape.addView(subtitle)
        shape.addView(paragraph)
        shape.addView(button)

        addSubview(shape)
    }
    
    func setupConstraints() {
        shape.translatesAutoresizingMaskIntoConstraints = false
        heading.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            shape.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shape.topAnchor.constraint(equalTo: self.topAnchor),
            shape.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shape.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            heading.leadingAnchor.constraint(equalTo: shape.contentViewLeadingAnchor),
            heading.topAnchor.constraint(equalTo: shape.contentViewTopAnchor),
            heading.trailingAnchor.constraint(equalTo: shape.contentViewTrailingAnchor),
            
            subtitle.leadingAnchor.constraint(equalTo: shape.contentViewLeadingAnchor),
            subtitle.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: Spacing.xxxs.rawValue),
            subtitle.trailingAnchor.constraint(equalTo: shape.contentViewTrailingAnchor),
            
            paragraph.leadingAnchor.constraint(equalTo: shape.contentViewLeadingAnchor),
            paragraph.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: Spacing.xxs.rawValue),
            paragraph.trailingAnchor.constraint(equalTo: shape.contentViewTrailingAnchor),
            
            button.leadingAnchor.constraint(equalTo: shape.contentViewLeadingAnchor),
            button.topAnchor.constraint(equalTo: paragraph.bottomAnchor, constant: Spacing.sm.rawValue),
            button.bottomAnchor.constraint(equalTo: shape.contentViewBottomAnchor)
        ])
        
    }
}
