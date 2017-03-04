import SpriteKit

class GameSceneView: SKView {
    private var gameScene: GameScene!
    static var touchBarSize = CGSize(width: 1085, height: 30)
    
    convenience init() {
        self.init(frame: NSRect(x: 0,
                                y: 0,
                                width: GameSceneView.touchBarSize.width,
                                height: GameSceneView.touchBarSize.height))
        gameScene = GameScene(size: GameSceneView.touchBarSize)
        presentScene(gameScene)
    }
    
    
    
    override func touchesBegan(with event: NSEvent) {
        super.touchesBegan(with: event)
        let locations = event.allTouches().map { touch -> NSPoint in
            return touch.location(in: self)
        }
        gameScene.handleTouch(locations)
    }
}
