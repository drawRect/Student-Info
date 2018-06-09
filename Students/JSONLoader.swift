//
//  JSONLoader.swift
//  Students
//
//  Created by Ranjith Kumar on 6/9/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation

enum MockLoaderError:Error {
    case invalidFileName(String)
    case invalidFileURL(URL)
    case invalidJSON(String)
    func desc(){
        switch self {
        case .invalidFileName(let name): debugPrint("\(name) FileName is incorrect")
        case .invalidFileURL(let url): debugPrint("\(url) FilePath is incorrect")
        case .invalidJSON(let name): debugPrint("\(name) has Invalid JSON")
        }
    }
}

struct JSONLoader {
    static func loadMockFile(named fileName:String,bundle:Bundle = .main) throws -> Students {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {throw MockLoaderError.invalidFileName(fileName)}
        do {
            let data = try Data(contentsOf: url)
            if let students = try? JSONDecoder().decode(Students.self, from: data) {
                return students
            }else {
                throw MockLoaderError.invalidFileURL(url)
            }
        }catch {
            throw MockLoaderError.invalidJSON(fileName)
        }
    }
}
