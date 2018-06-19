//
//  JSONLoader.swift
//  Students
//
//  Created by Ranjith Kumar on 6/9/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}


extension Result where Value == Data {
    func decoded<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        let data = try resolve()
        return try decoder.decode(T.self, from: data)
    }
}

extension Result {
    func resolve() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

enum MockLoaderError: Error {
    case invalidFileName(String)
    case invalidFileURL(URL)
    case invalidJSON(String)

    var localizedDescription: String {
        switch self {
        case let .invalidFileName(name): return "\(name) FileName is incorrect"
        case let .invalidFileURL(url): return "\(url) FilePath is incorrect"
        case let .invalidJSON(name): return "\(name) has Invalid JSON"
        }
    }
}

struct JSONLoader {
    static func loadMockFile<A: Decodable>(_ resource: Resource<A>, bundle: Bundle = .main) throws -> A {
        guard let url = bundle.url(forResource: resource.name, withExtension: resource.ext)
            else {
                throw MockLoaderError.invalidFileName(resource.name)
        }
        do {
            let data = try Data(contentsOf: url)
            if let model = try? JSONDecoder().decode(A.self, from: data) {
                return model
            } else {
                throw MockLoaderError.invalidFileURL(url)
            }
        }catch {
            throw MockLoaderError.invalidJSON(resource.name)
        }
    }
    
    static func _loadMockFile(_ fileName: String, bundle: Bundle = .main, completionHandler: @escaping (_ result:Result<Data>)->Void) {
        guard let url = bundle.url(forResource: fileName, withExtension: "json")
            else {
                return print("Could not load the JSON File :(")
        }
        if let data = try? Data(contentsOf: url) {
            completionHandler(Result.success(data))
        }else {
            
        }
    }
}

