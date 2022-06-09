//
//  SVGViewController.swift
//  Example
//
//  Created by Andrew Wang on 2022/6/9.
//  Copyright © 2022 Exyte. All rights reserved.
//

import UIKit
import Macaw

final class SVGViewController: UIViewController {
    
    private var imageView: SVGImageView = {
        let node = (try! SVGParser.parse(resource: "flovatar"))
        let imageView = SVGImageView(node: node, frame: .zero)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
