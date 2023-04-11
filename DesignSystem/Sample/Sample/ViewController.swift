//
//  ViewController.swift
//  Sample
//
//  Created by Elen Souza on 11/04/23.
//

import UIKit
import DesignSystem

final class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: BaseLabel = {
        let label = BaseLabel(text: "Sample", style: .headingSmall)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: BaseLabel = {
        let label = BaseLabel(text: "Subtitle SM", style: .subtitleSmall)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let paragraphLabel: BaseLabel = {
        let label = BaseLabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ", style: .paragraph)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let card: CardContent = {
        let card = CardContent()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.addSubview(titleLabel)
        container.addSubview(subtitleLabel)
        container.addSubview(paragraphLabel)
        container.addSubview(card)
        scrollView.addSubview(container)
        view.addSubview(scrollView)
        
        let heightConstraint = container.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            container.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            heightConstraint,
            
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 64),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            paragraphLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            paragraphLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            paragraphLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            card.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            card.topAnchor.constraint(equalTo: paragraphLabel.bottomAnchor, constant: 64),
            card.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            card.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor),
        ])
    }
}
