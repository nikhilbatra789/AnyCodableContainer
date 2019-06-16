//
//  ViewController.swift
//  NBCodableContainer
//
//  Created by nikhil-advoco on 06/16/2019.
//  Copyright (c) 2019 nikhil-advoco. All rights reserved.
//

import UIKit
import NBCodableContainer

class ViewController: UIViewController {

    
    var sampleJSON = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let preModel = ModelClass()
        preModel.array = ["abc",10,true]
        preModel.dict = ["name":"Nikhil Batra","age":10]
        preModel.anyObject = true
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(preModel)
            let model = try JSONDecoder().decode(ModelClass.self, from: data)
            print("Original Model String: \(model.jsonString() ?? "")")
        } catch {
            print(error)
        }
        
    }

}

class ModelClass : NSObject, Codable {
    
    var array: [Any]?
    var dict: [String:Any]?
    var anyObject: Any?
    
    enum CodingKeys: String, CodingKey {
        case array
        case dict
        case anyObject
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.array = try container.decodeIfPresent([Any].self, forKey: .array)
        self.dict = try container.decodeIfPresent([String:Any].self, forKey: .dict)
        self.anyObject = try container.decodeAnyIfPresent(Any.self, forKey: .anyObject)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(array, forKey: .array)
        try container.encodeIfPresent(dict, forKey: .dict)
        try container.encodeAnyIfPresent(anyObject, forKey: .anyObject)
        
    }
}

extension Encodable {
    
    func jsonString() -> String? {
        if let jsonData = self.dataForObject() {
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        }
        return nil
    }
    
    func dataForObject() -> Data? {
        //Some code
        do {
            let data = try JSONEncoder().encode(self)
            return data
        } catch {
            print("error : " + error.localizedDescription)
            return nil
        }
    }
}

