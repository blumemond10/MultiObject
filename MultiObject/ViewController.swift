

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView = ARSCNView(frame:self.view.frame)
        self.view.addSubview(self.sceneView)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene

        let scene = SCNScene()
        
        let textGeometry = SCNText(string: "Hello Swift", extrusionDepth: 1.0)
                let textNode = SCNNode(geometry: textGeometry)
                    textNode.position = SCNVector3(0,0.1,-0.6)
                    textNode.scale  = SCNVector3(0.02,0.02,0.02)
        
        
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius:0)
            let boxMaterial = SCNMaterial()
            //boxMaterial.diffuse.contents = UIColor.blue
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/brick.jpg")!
                let node = SCNNode()
                    node.geometry = box
                    node.geometry?.materials = [boxMaterial]
        node.position = SCNVector3(-0.5,0.2,-0.5)
       
        let sphere = SCNSphere(radius: 0.2)
            let sphereMaterial = SCNMaterial()
            //sphereMaterial.diffuse.contents = UIColor.green
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/earthmap.jpeg")!
            textGeometry.firstMaterial?.diffuse.contents = UIColor.orange
                let sphereNode = SCNNode()
                           sphereNode.geometry = sphere
                           sphereNode.geometry?.materials = [sphereMaterial]
                           sphereNode.position = SCNVector3(0.4,0.1,-1)
                
        scene.rootNode.addChildNode(sphereNode)
        scene.rootNode.addChildNode(textNode)
        scene.rootNode.addChildNode(node)
        
        
        
        
       
        
        
        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
