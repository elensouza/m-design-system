//
//  PrimaryButton.swift
//  
//
//  Created by Elen Souza on 09/04/23.
//

import UIKit

public final class PrimaryButton: UIButton {
    public override var isSelected: Bool {
        didSet {
            setBackground()
        }
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    public convenience init(title: String, edgesInset: SpacingSquish) {
        self.init()
        self.setTitle(title, for: .normal)
        self.contentEdgeInsets = edgesInset.edges
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    private func setup() {
        setupFont()
        setupColor()
        setBackground()
    }
    
    private func setupFont() {
        titleLabel?.font = UIFont(size: .sm, weight: .medium)
    }
    
    private func setupColor() {
        setTitleColor(NeutralColors.color1, for: .normal)
    }
    
    private func setBackground() {
        backgroundColor = isSelected ? BrandColors.color4 : BrandColors.color3
    }
}
