# NBCodableContainer

[![Generic badge](https://img.shields.io/badge/Build-passing-bright_green.svg)](https://shields.io/)  [![Generic badge](https://img.shields.io/badge/Swift-5-blue.svg)](https://shields.io/) [![Generic badge](https://img.shields.io/badge/Swift-4.2-blue.svg)](https://shields.io/) [![Generic badge](https://img.shields.io/badge/Pod-compatible-orange.svg)](https://shields.io/)

NBCodableContainer contains is an extention to KeyedDecodingContainer & KeyedEncodingContainer enabling you to Decode and Encode [Any], [String:Any], Any type variables.

### Features

- Any type would be able to handle Double, Float, Int, UInt, String, Bool, Date.
- Able to handle nil while decoding and Encoding Both
- It also supports UnkeyedEncodingContainer.
- Compatible with Swift 5 and Swift 4.2. 

### Installation

Install using pod
```ruby
pod 'NBCodableContainer'
```

### Usage

Class should follow codable protocol
```
class SampleClass: NSObject, Codable { }
```

Implement codable protocol would have a container. This is a standard implementation.
```
extension SampleClass {

required convenience public init(from decoder: Decoder) throws {
self.init()
let container = try decoder.container(keyedBy: CodingKeys.self)
}

public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: CodingKeys.self)
}
}
```

Now use the extension to decode you Dictionary and Array
```
//optional value
self.dict = try container.decodeIfPresent([Any:String].self, forKey: .dict)

//non-optional value
self.dict = try container.decode([Any:String].self, forKey: .dict)
```

Now use the extension to Encode you Dictionary and Array
```
//optional value
try container.encodeIfPresent(dict, forKey: .dict)

//non-optional value
try container.encode(dict, forKey: .dict)
```

Handling of Any type is some what different from dictionary and Array. In that we cannot ovveride normal methods encodeIfPresent or decodeIfPresent as it will lead to calling overrided methods in case of normal decoding types like Bool, String etc
```
//Decode optional value
self.obj = try container.decodeAnyIfPresent(Any.self, forKey: .obj)

//Decode non-optional value
self.obj = try container.decodeAny(Any.self, forKey: .obj)

//Encode optional value
try container.encodeAnyIfPresent(obj, forKey: .obj)

//Encode non-optional value
try container.encode(obj, forKey: .obj)
```

## Author

nikhilbatra789@gmail.com

License
----
NBCodableContainer is available under the GNU GENERAL PUBLIC LICENSE Version 3. See the LICENSE file for more info.

**Happy Coding**
