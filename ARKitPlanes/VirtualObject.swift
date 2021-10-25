//
//  VirtualObject.swift
//  ARKitPlanes
//
//  Created by Oleg Kanatov on 25.10.21.
//

import SceneKit

class VirtualObject: SCNReferenceNode {
    
    static let availableObjects: [SCNReferenceNode] = {
        
        guard let modelsURLs = Bundle.main.url(forResource: "art.scnassets", withExtension: nil) else { return [] }
        
        let fileEnumirator = FileManager().enumerator(at: modelsURLs, includingPropertiesForKeys: nil)!
        
        return fileEnumirator.flatMap{ element in
            
            let url = element as! URL
            
            guard url.pathExtension == "scn" else { return nil }
            
            return VirtualObject(url: url)
        }
    }()
}
