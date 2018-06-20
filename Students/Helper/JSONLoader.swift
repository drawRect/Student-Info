//
//  JSONLoader.swift
//  Students
//
//  Created by Ranjith Kumar on 6/9/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

enum MockLoaderError: Error {
    case invalidFileName(String)
    case invalidFileURL(URL)
    case invalidJSON(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidFileName(_): return "FileName is incorrect"
        case .invalidFileURL(_): return "FilePath is incorrect"
        case .invalidJSON(_): return "File has Invalid JSON"
        }
    }
}

struct JSONLoader {
    static func loadMockFile<A: Decodable>(_ resource: Resource<A>, bundle: Bundle = .main) throws -> A {
        guard let url = bundle.url(forResource: resource.name, withExtension: nil), url.pathExtension == "json"
            else {
                throw MockLoaderError.invalidFileName(resource.name)
        }
        
        guard let data = try? Data(contentsOf: url) else { throw MockLoaderError.invalidFileURL(url) }
        let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        if JSONSerialization.isValidJSONObject(jsonData) {
            guard let model = try? JSONDecoder().decode(A.self, from: data) else {
                throw MockLoaderError.invalidFileURL(url)
            }
            return model
        } else {
            throw MockLoaderError.invalidJSON(resource.name)
        }
    }
}
