//
//  main.swift
//  hello-gpx
//
//  Created by drypot on 2022/10/02.
//

import Foundation

func dumpFile() {
 
    func string(fromPath path: String) -> String {
        let text = try? String(contentsOfFile: path, encoding: .utf8)
        return text ?? "reading error"
    }
    
    // print(FileManager.default.currentDirectoryPath)
    // print(#file)
    
    let sourceFileUrl = URL(fileURLWithPath: #file)
    let directorytUrl = sourceFileUrl.deletingLastPathComponent()
    let samplePath = directorytUrl.path + "/gpx-sample-1.gpx"
    
    print(samplePath)
    let string = string(fromPath: samplePath)
    print(string)
    
}
