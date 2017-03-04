import Foundation
import Cocoa
import SpriteKit

class WindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
    }
    
    var touchBarSize: CGSize {
        return CGSize(width: 1085, height: 30)
    }
    
    override func makeTouchBar() -> NSTouchBar? {
        
        let touchBarIdenitifier = NSTouchBarCustomizationIdentifier(rawValue: "org.giginet.RikoBuster")
        let touchBarSceneIdentifier = NSTouchBarItemIdentifier(rawValue: "org.giginet.RikoBuster.scene")
        
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = touchBarIdenitifier
        touchBar.defaultItemIdentifiers = [touchBarSceneIdentifier]
        touchBar.customizationAllowedItemIdentifiers = [touchBarSceneIdentifier]
        
        return touchBar
    }
}

extension WindowController: NSTouchBarDelegate {
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        
        if identifier.rawValue == "org.giginet.RikoBuster.scene" {
            let custom = NSCustomTouchBarItem(identifier: identifier)
            custom.customizationLabel = "Scene"
            
            let skView = SKView(frame: NSRect(x: 0,
                                              y: 0,
                                              width: touchBarSize.width,
                                              height: touchBarSize.height))
            let scene = GameScene(size: skView.frame.size)
            skView.presentScene(scene)
            custom.view = skView
            
            return custom
        }
        
        return nil
    }
}
