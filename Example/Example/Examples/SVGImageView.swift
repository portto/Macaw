//
//  SVGImageView.swift
//  Example
//
//  Created by Andrew Wang on 2022/6/8.
//  Copyright © 2022 Exyte. All rights reserved.
//

import UIKit
import Macaw

class SVGImageView: UIView {
    
    var node: Node
    
    public init(node: Node, frame: CGRect) {
        self.node = node
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.node = Group()
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        let imageGenerator = SVGImageGenerator(size: CGSize(width: 1000, height: 2000), node: node)
        if let image = imageGenerator.generate() {
            let imageView = UIImageView(image: image)
            imageView.backgroundColor = .gray
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        } else {
            fatalError("image is nil.")
        }
    }

}
