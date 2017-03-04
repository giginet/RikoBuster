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
        riko.run(SKAction.move(by: CGVector(dx: 0, dy: 30), duration: 0.5))
        
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
            birds.remove(at: index)
            bird.removeFromParent()
        }
    }
}
