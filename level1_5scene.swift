import SpriteKit
import SwiftUICore

class level1_5scene: SKScene {
    var player: SKSpriteNode!
    var walkFrames: [SKTexture] = []
    var ground: SKSpriteNode!
    var background: SKSpriteNode!   // background variable

    var destination: CGPoint?
    let playerSpeed: CGFloat = 150.0

    override func didMove(to view: SKView) {
        // Initialize background image
        background = SKSpriteNode(imageNamed: "white.png") // replace with your asset name
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size
        background.zPosition = -1
        addChild(background)

        // Set gravity for physics
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

        // Create ground
        ground = SKSpriteNode(color: .brown, size: CGSize(width: size.width, height: 40))
        ground.position = CGPoint(x: size.width / 2, y: ground.size.height / 2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false
        addChild(ground)

        // Load walk cycle frames from atlas named "WalkCycle"
        let walkAtlas = SKTextureAtlas(named: "WalkCycle")
        for i in 1...6 {
            walkFrames.append(walkAtlas.textureNamed("outlineWalk\(i)"))
        }

        // Create player sprite with first frame
        player = SKSpriteNode(texture: walkFrames[0])
        player.size = CGSize(width: 120, height: 120)
        player.position = CGPoint(x: size.width * 0.1,
                                  y: ground.position.y + ground.size.height / 2 + player.size.height / 2)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.restitution = 0.0
        player.physicsBody?.friction = 1.0
        addChild(player)
    }

    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        destination = CGPoint(x: location.x, y: player.position.y) // only horizontal movement
        startWalkingAnimation()
    }

    func startWalkingAnimation() {
        // Only play if not already running
        if player.action(forKey: "walking") == nil {
            let walkAnimation = SKAction.animate(with: walkFrames, timePerFrame: 0.15)
            let walkForever = SKAction.repeatForever(walkAnimation)
            player.run(walkForever, withKey: "walking")
        }
    }

    func stopWalkingAnimation() {
        player.removeAction(forKey: "walking")
        player.texture = SKTexture(imageNamed: "stand_1") // reset to first frame
    }

    override func update(_ currentTime: TimeInterval) {
        guard let destX = destination?.x else { return }

        let diff = destX - player.position.x
        if abs(diff) < 1.5 {
            destination = nil
            stopWalkingAnimation()
            player.physicsBody?.velocity.dx = 0
            return
        }

        let direction: CGFloat = diff > 0 ? 1 : -1
        player.xScale = abs(player.xScale) * direction // flip correctly left/right

        player.physicsBody?.velocity.dx = direction * playerSpeed
    }
}



