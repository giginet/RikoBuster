import Foundation
import Cocoa
import SpriteKit

class WindowController: NSWindowController, NSGestureRecognizerDelegate {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
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
            
            let skView = GameSceneView()
            custom.view = skView
            
            return custom
        }
        
        return nil
    }
}
