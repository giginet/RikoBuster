import SpriteKit

class GameScene: SKScene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        let riko = SKSpriteNode(imageNamed: "riko1")
        riko.position = CGPoint(x: 0, y: 15)
        riko.run(SKAction.move(to: CGPoint(x: 1000, y: 0), duration: 10))
        
        addChild(riko)
    }
}
