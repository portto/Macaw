//
//  SVGImageGenerator.swift
//  Macaw
//
//  Created by Andrew Wang on 2022/6/10.
//

import Foundation

public class SVGImageGenerator {
    
    private let size: CGSize
    private let node: Node
    private let placeManager = RootPlaceManager()
    private let layoutHelper = LayoutHelper()
    
    var place: Transform {
        return placeManager.placeVar.value
    }
    
    public init(size: CGSize, node: Node) {
        self.size = size
        self.node = node
    }
    
    public init(size: CGSize, svgString: String) {
        self.size = size
        do {
            node = try SVGParser.parse(text: svgString)
        } catch {
            assertionFailure("svgString is not valid.")
            node = Group()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func generate() -> UIImage? {
        try? node.toNativeImage(size: size.toMacaw(), layout: ContentLayout.of(), scale: UIScreen.main.scale)
    }
    
}
