//
//  FileHelper.swift
//  Ideia
//
//  Created by Juliana Santana on 27/07/21.
//
import UIKit

class FileHelper {
    static func GetDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static func SaveToFiles(image: UIImage?) -> String {
        if let data = image?.jpegData(compressionQuality: 1) {
            let directory = GetDocumentDirectory()
            let path = directory.appendingPathComponent("\(UUID().uuidString).jpeg")
            try? data.write(to: path)
            return path.lastPathComponent
        }
        
     return ""
    }
    
    static func DeleteImage(path: String) -> Bool {
        let imagePath = GetDocumentDirectory().appendingPathComponent(path)
        if FileManager.default.fileExists(atPath: imagePath.relativePath)
        {
            try! FileManager.default.removeItem(at: imagePath)
            return true
        }
        return false
    }
    
    static func GetFilePath(fileName: String) -> String {
        let imagePath = GetDocumentDirectory().appendingPathComponent(fileName)
        return imagePath.relativePath
    }
}
