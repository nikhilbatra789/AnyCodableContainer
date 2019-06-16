//
//  NBCodableContainer.swift
//  NBCodableContainer
//
//  Created by Nikhil Batra on 16/06/19.
//

import Foundation

//MARK:- Encoder
extension UnkeyedEncodingContainer {
    
    mutating func encode(_ object: Dictionary<String, Any>) throws {
        var nestedContainer = self.nestedContainer(keyedBy: JSONCodingKeys.self)
        try nestedContainer.encode(object)
    }
    
    mutating func encode(_ object: Array<Any>) throws {
        
        for item in object {
            if let intValue = item as? Int {
                try? self.encode(intValue)
            } else if let intValue = item as? Int8 {
                try? self.encode(intValue)
            } else if let intValue = item as? Int16 {
                try? self.encode(intValue)
            } else if let intValue = item as? Int32 {
                try? self.encode(intValue)
            } else if let intValue = item as? Int64 {
                try? self.encode(intValue)
            } else if let intValue = item as? UInt {
                try? self.encode(intValue)
            } else if let intValue = item as? UInt8 {
                try? self.encode(intValue)
            } else if let intValue = item as? UInt16 {
                try? self.encode(intValue)
            } else if let intValue = item as? UInt32 {
                try? self.encode(intValue)
            } else if let intValue = item as? UInt64 {
                try? self.encode(intValue)
            } else if let floatValue = item as? Float {
                try? self.encode(floatValue)
            } else if let doubleValue = item as? Double {
                try? self.encode(doubleValue)
            } else if let stringValue = item as? String {
                try? self.encode(stringValue)
            } else if let dateValue = item as? Date {
                try? self.encode(dateValue)
            }
                //            else if let urlValue = item as? URL {
                //                try? self.encode(urlValue)
                //            }
            else if let stringValue = item as? String {
                try? self.encode(stringValue)
            } else if let boolValue = item as? Bool {
                try? self.encode(boolValue)
            }
            else if let nestedDictionary = item as? [String:Any] {
                try? self.encode(nestedDictionary)
            } else if let nestedArray = item as? [Any] {
                try? self.encode(nestedArray)
            }
        }
    }
}

extension KeyedEncodingContainer {
    
    public mutating func encode(_ object: Dictionary<String, Any>, forKey key: K) throws {
        var container = self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        try? container.encode(object)
    }
    
    public mutating func encodeIfPresent(_ object: Dictionary<String, Any>?, forKey key: K) throws {
        if let object = object {
            try? encode(object, forKey: key)
        } else {
            try? self.encodeNil(forKey: key)
        }
    }
    
    public mutating func encode(_ object: Array<Any>, forKey key: K) throws {
        var container = self.nestedUnkeyedContainer(forKey: key)
        try? container.encode(object)
    }
    
    public mutating func encodeIfPresent(_ object: Array<Any>?, forKey key: K) throws {
        if let object = object {
            var container = self.nestedUnkeyedContainer(forKey: key)
            try? container.encode(object)
        } else {
            try? self.encodeNil(forKey: key)
        }
    }
    
    public mutating func encode(_ object: Dictionary<String,Any>) throws {
        for key in object.keys {
            let currentObj = object[key] as Any
            try? self.encodeObject(currentObj, forKey: JSONCodingKeys(stringValue: key) as! K)
        }
    }
    
    public mutating func encodeAny(_ object: Any, forKey key: K) throws {
        try? self.encodeObject(object, forKey: key)
    }
    
    public mutating func encodeAnyIfPresent(_ object: Any?, forKey key: K) throws {
        if let object = object {
            try? self.encodeObject(object, forKey: key)
        } else {
            try? self.encodeNil(forKey: key)
        }
    }
    
    private mutating func encodeObject(_ object: Any, forKey key: K)  throws {
        if let intValue = object as? Int {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? Int8 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? Int16 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? Int32 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? Int64 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? UInt {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? UInt8 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? UInt16 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? UInt32 {
            try? self.encode(intValue, forKey: key)
        } else if let intValue = object as? UInt64 {
            try? self.encode(intValue, forKey: key)
        } else if let floatValue = object as? Float {
            try? self.encode(floatValue, forKey: key)
        } else if let doubleValue = object as? Double {
            try? self.encode(doubleValue, forKey: key)
        } else if let dateValue = object as? Date {
            try? self.encode(dateValue, forKey: key)
        }
            //        else if let urlValue = object as? URL {
            //            try? self.encode(urlValue, forKey: key)
            //        }
        else if let stringValue = object as? String {
            try? self.encode(stringValue, forKey: key)
        } else if let doubleValue = object as? Double {
            try? self.encode(doubleValue, forKey: key)
        } else if let boolValue = object as? Bool {
            try? self.encode(boolValue, forKey: key)
        } else if let nestedDictionary = object as? [String:Any] {
            try? self.encode(nestedDictionary, forKey: key)
        } else if let nestedArray = object as? [Any] {
            try? self.encode(nestedArray, forKey: key)
        }
    }
}

//MARK:- Decoder
extension KeyedDecodingContainer {
    
    public func decode(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any> {
        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
        return try container.decode(type)
    }
    
    public func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any>? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    public func decode(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any> {
        var container = try self.nestedUnkeyedContainer(forKey: key)
        return try container.decode(type)
    }
    
    public func decodeIfPresent(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any>? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decode(type, forKey: key)
    }
    
    public func decodeAnyIfPresent(_ type: Any.Type?, forKey key: K) throws -> Any? {
        guard contains(key) else {
            return nil
        }
        guard try decodeNil(forKey: key) == false else {
            return nil
        }
        return try decodeObjectForKey(key)
    }
    
    public func decodeAny(_ type: Any.Type, forKey key: K) throws -> Any? {
        return try decodeObjectForKey(key)
    }
    
    public func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        var dictionary = Dictionary<String, Any>()
        
        for key in allKeys {
            if let anyObject = try? decodeObjectForKey(key) {
                dictionary[key.stringValue] = anyObject
            }
        }
        return dictionary
    }
    
    func decodeObjectForKey(_ key: K) throws -> Any? {
        if let doubleValue = try? decode(Double.self, forKey: key) {
            return doubleValue
        } else if let floatValue = try? decode(Float.self, forKey: key) {
            return floatValue
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(Int8.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(Int16.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(Int32.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(Int64.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(UInt.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(UInt8.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(UInt16.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(UInt32.self, forKey: key) {
            return intValue
        } else if let intValue = try? decode(UInt64.self, forKey: key) {
            return intValue
        } else if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        } else if let dateValue = try? decode(Date.self, forKey: key) {
            return dateValue
        }
            //        else if let urlValue = try? decode(URL.self, forKey: key) {
            //            return urlValue
            //        }
        else if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
            return nestedDictionary
        } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
            return nestedArray
        }
        return nil
    }
}

extension UnkeyedDecodingContainer {
    
    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
        var array: [Any] = []
        while isAtEnd == false {
            // See if the current value in the JSON array is `null` first and prevent infite recursion with nested arrays.
            if try decodeNil() {
                continue
            } else if let value = try? decode(Double.self) {
                array.append(value)
            } else if let value = try? decode(Float.self) {
                array.append(value)
            } else if let value = try? decode(Int.self) {
                array.append(value)
            } else if let value = try? decode(Int8.self) {
                array.append(value)
            } else if let value = try? decode(Int16.self) {
                array.append(value)
            } else if let value = try? decode(Int32.self) {
                array.append(value)
            } else if let value = try? decode(Int64.self) {
                array.append(value)
            } else if let value = try? decode(UInt.self) {
                array.append(value)
            } else if let value = try? decode(UInt8.self) {
                array.append(value)
            } else if let value = try? decode(UInt16.self) {
                array.append(value)
            } else if let value = try? decode(UInt32.self) {
                array.append(value)
            } else if let value = try? decode(UInt64.self) {
                array.append(value)
            } else if let value = try? decode(Bool.self) {
                array.append(value)
            } else if let value = try? decode(String.self) {
                array.append(value)
            } else if let value = try? decode(Date.self) {
                array.append(value)
            }
                //            else if let value = try? decode(URL.self) {
                //                array.append(value)
                //            }
            else if let value = try? decode(String.self) {
                array.append(value)
            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
                array.append(nestedDictionary)
            } else if let nestedArray = try? decode(Array<Any>.self) {
                array.append(nestedArray)
            }
        }
        return array
    }
    
    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
        
        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
        return try nestedContainer.decode(type)
    }
}

struct JSONCodingKeys: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int?
    
    init?(intValue: Int) {
        self.init(stringValue: "\(intValue)")
        self.intValue = intValue
    }
}

