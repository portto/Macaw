import Foundation

#if os(iOS)
import UIKit
#endif

class GroupRenderer: NodeRenderer {

    var group: Group
    var renderers: [NodeRenderer] = []

    override var node: Node {
        return group
    }

    init(group: Group, size: CGSize?, parentRenderer: GroupRenderer? = nil) {
        self.group = group
        super.init(size: size, parentRenderer: parentRenderer)
        updateRenderers()
    }

    override func freeCachedAbsPlace() {
        for renderer in renderers {
            renderer.freeCachedAbsPlace()
        }
    }

    override func doRender(in context: CGContext, force: Bool, opacity: Double, coloringMode: ColoringMode = .rgb) {
        renderers.forEach { renderer in
            renderer.render(in: context, force: force, opacity: opacity, coloringMode: coloringMode)
        }
    }

    override func doFindNodeAt(path: NodePath, ctx: CGContext) -> NodePath? {
        for renderer in renderers.reversed() {
            if let result = renderer.findNodeAt(parentNodePath: path, ctx: ctx) {
                return result
            }
        }
        return .none
    }

    private func updateRenderers() {

        renderers.forEach {
            $0.dispose()
        }
        renderers.removeAll()

        renderers = group.contents.compactMap { child -> NodeRenderer? in
            RenderUtils.createNodeRenderer(child, size: size, parentRenderer: self)
        }

        var parent: NodeRenderer = self
        while let parentRenderer = parent.parentRenderer {
            parent = parentRenderer
        }
        parent.calculateZPositionRecursively()
    }
}
