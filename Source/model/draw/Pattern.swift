open class Pattern: Fill {

    public let content: Node
    public let bounds: Rect
    public let userSpace: Bool

    public init(content: Node, bounds: Rect, userSpace: Bool = false) {
        self.content = content
        self.bounds = bounds
        self.userSpace = userSpace
    }
    
    override func equals<T>(other: T) -> Bool where T: Fill {
        guard let other = other as? Pattern else {
            return false
        }
        
        guard content.isEqual(other.content) else {
            return false
        }
        
        guard bounds.equals(other: other.bounds) else {
            return false
        }
        
        guard userSpace == other.userSpace else {
            return false
        }
        
        return true
    }
}
