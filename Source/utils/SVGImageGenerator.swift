//
//  SVGImageGenerator.swift
//  Macaw
//
//  Created by Andrew Wang on 2022/6/9.
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
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        
        ctx.setFlatness(1)
        ctx.interpolationQuality = .default
        
        let renderer = RenderUtils.createNodeRenderer(node, size: size)
        
        // TODO: actually we should track all changes
        placeManager.setLayout(place: layoutHelper.getTransform(renderer, .none, size.toMacaw()))
        ctx.concatenate(place.toCG())
        
        renderer.calculateZPositionRecursively()
        renderer.render(in: ctx, force: false, opacity: node.opacity)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
