import SpriteKit

class GameScene: SKScene {
    private var timer: NSInteger = 0
    private var birds: [SKSpriteNode] = []
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        timer += 1
        if timer % 30 == 0 {
            popBird()
            timer = 0
        }
    }
    
    func popBird() {
        let positionX = arc4random() % 1000
        let riko = SKSpriteNode(imageNamed: "riko1")
        riko.position = CGPoint(x: Int(positionX), y: -20)
        riko.run(SKAction.sequence([
            SKAction.move(by: CGVector(dx: 0, dy: 30), duration: 0.5),
            SKAction.wait(forDuration: 1.0),
            SKAction.move(by: CGVector(dx: 0, dy: -30), duration: 0.5),
            SKAction.customAction(withDuration: 0, actionBlock: { (bird, _) in
                if let bird = bird as? SKSpriteNode,
                    let index = self.birds.index(of: bird) {
                    self.birds.remove(at: index)
                }
                
            }),
            SKAction.removeFromParent(),
        ]))
        
        addChild(riko)
        birds.append(riko)
    }
    
    func handleTouch(_ locations: [CGPoint]) {
        for location in locations {
            let sceneLocation = convertPoint(fromView: location)
            for bird in birds {
                if bird.contains(sceneLocation) {
                    kill(bird: bird)
                }
            }
        }
    }
    
    func kill(bird: SKSpriteNode) {
        if let index = birds.index(of: bird) {
            let explosion = SKSpriteNode(imageNamed: "explosion")
            explosion.position = bird.position
            addChild(explosion)
            explosion.setScale(0)
            
            explosion.run(SKAction.sequence([
                SKAction.scale(to: 1.0, duration: 0.25),
                SKAction.wait(forDuration: 0.25),
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.removeFromParent(),
            ]))
            
            birds.remove(at: index)
            bird.removeFromParent()
            
        }
    }
}
