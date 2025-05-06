//
//  CommonFunctions.swift
//  IAmFit
//
//  Created by Vivek Thorat on 05/05/25.
//

import UIKit
import ImageIO
import MobileCoreServices



func gifImage(named name: String) -> UIImage? {
    guard let path = Bundle.main.path(forResource: name, ofType: "gif"),
          let data = NSData(contentsOfFile: path) else {
        return nil
    }
    return gifImage(data: data as Data)
}

func gifImage(data: Data) -> UIImage? {
    guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
        return nil
    }
    
    var images = [UIImage]()
    var duration = 0.0
    
    let count = CGImageSourceGetCount(source)
    for i in 0..<count {
        guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else { continue }
        
        // Get delay for frame
        let delaySeconds = delayForImageAtIndex(i, source: source)
        duration += delaySeconds
        
        images.append(UIImage(cgImage: cgImage))
    }
    
    return UIImage.animatedImage(with: images, duration: duration)
}

func delayForImageAtIndex(_ index: Int, source: CGImageSource) -> Double {
    var delay = 0.1
    if let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any],
       let gif = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
       let unclampedDelay = gif[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double ?? gif[kCGImagePropertyGIFDelayTime as String] as? Double {
        delay = unclampedDelay
    }
    return delay
}

