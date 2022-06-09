import Foundation

#if os(iOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

let animationProducer = AnimationProducer()

class AnimationProducer {

    var storedAnimations = [Node: BasicAnimation]() // is used to make sure node is in view hierarchy before actually creating the animation
    var delayedAnimations = [BasicAnimation: Timer]()
    var displayLink: MDisplayLinkProtocol?

    struct ContentAnimationDesc {
        let animation: ContentsAnimation
        let startDate: Date
        let finishDate: Date
        let completion: (() -> Void)?
    }

    var contentsAnimations = [ContentAnimationDesc]()

    func play(_ animation: BasicAnimation, _ context: AnimationContext, withoutDelay: Bool = false) {
        // remove for now, cause we don't need animation right now.
    }

    func removeDelayed(animation: BasicAnimation) {
        // remove for now, cause we don't need animation right now.
    }

    // MARK: - Sequence animation
    func addAnimationSequence(_ animationSequence: Animation,
                              _ context: AnimationContext) {
        // remove for now, cause we don't need animation right now.
    }

    // MARK: - Empty Animation
    fileprivate func executeCompletion(_ emptyAnimation: BasicAnimation) {
        // remove for now, cause we don't need animation right now.
    }

    // MARK: - Stored animation
    func addStoredAnimations(_ node: Node, _ view: DrawingView) {
        // remove for now, cause we don't need animation right now.
    }

    func addStoredAnimations(_ node: Node, _ context: AnimationContext) {
        // remove for now, cause we don't need animation right now.
    }

    // MARK: - Contents animation

    func addContentsAnimation(_ animation: BasicAnimation, _ context: AnimationContext, completion: @escaping (() -> Void)) {
        // remove for now, cause we don't need animation right now.
    }

    func updateContentAnimations(_ context: AnimationContext) {
        // remove for now, cause we don't need animation right now.
    }
}

class AnimationContext {

    var rootTransform: Transform?

    func getLayoutTransform(_ renderer: NodeRenderer?) -> Transform {
        return rootTransform ?? Transform.identity
    }

}
