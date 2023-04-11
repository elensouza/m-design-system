#!/usr/bin/swift

import Foundation

// MARK: - Tokens
struct Tokens: Decodable {
    let border: Border
    let opacity: Opacity
    let shadow: Shadow
    let spacing: Spacing
    let spacingSquish: SpacingSquish
    let radius: Radius
    let font: Font
    let line: Line
    let brand: Brand
    let neutral: Neutral

    enum RootCodingKeys: String, CodingKey {
        case border, opacity, shadow, spacing, spacingSquish, radius, font, line, brand, neutral
    }
}

struct Attribute: Decodable {
    let value: String
}

struct Border: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .size)
    }
}

struct Opacity: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case level
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .level)
    }
}

struct Shadow: Decodable {
    let options: [String: ShadowChild]

    enum CodingKeys: String, CodingKey {
        case level
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: ShadowChild].self, forKey: .level)
    }
}

struct ShadowChild: Decodable {
    let horizontal: Attribute
    let vertical: Attribute
    let blur: Attribute

    enum CodingKeys: String, CodingKey {
        case x, y, b
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.horizontal = try container.decode(Attribute.self, forKey: .x)
        self.vertical = try container.decode(Attribute.self, forKey: .y)
        self.blur = try container.decode(Attribute.self, forKey: .b)
    }
}

struct Spacing: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .size)
    }
}

struct SpacingSquish: Decodable {
    let options: [String: SpacingSquishChild]

    enum CodingKeys: String, CodingKey {
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: SpacingSquishChild].self, forKey: .size)
    }
}

struct SpacingSquishChild: Decodable {
    let horizontal: Attribute
    let vertical: Attribute

    enum CodingKeys: String, CodingKey {
        case v, h
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.horizontal = try container.decode(Attribute.self, forKey: .h)
        self.vertical = try container.decode(Attribute.self, forKey: .v)
    }
}

struct Radius: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .size)
    }
}

struct Font: Decodable {
    let sizes: [String: Attribute]
    let families: [String: Attribute]
    let weights: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case size, family, weight
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sizes = try container.decode([String: Attribute].self, forKey: .size)
        self.families = try container.decode([String: Attribute].self, forKey: .family)
        self.weights = try container.decode([String: Attribute].self, forKey: .weight)
    }
}

struct Line: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case height
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .height)
    }
}

struct Brand: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case color, primary
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let colorsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .color)
        self.options = try colorsContainer.decode([String: Attribute].self, forKey: .primary)
    }
}

struct Neutral: Decodable {
    let options: [String: Attribute]

    enum CodingKeys: String, CodingKey {
        case color
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.options = try container.decode([String: Attribute].self, forKey: .color)
    }
}

guard let json = FileManager.default.contents(atPath: "../Sources/Resources/tokens.json") else {
    fatalError("Could not find JSON metadata file")
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let tokens = try decoder.decode(Tokens.self, from: json)

// MARK: - Border
let borderName = String(describing: type(of: tokens.border))
var borderEnum = """
import UIKit

public enum \(borderName): CGFloat {\n
"""

tokens.border.options.forEach { (key, attribute) in
    borderEnum += "    case \(key) = \(attribute.value.numbers)\n"
}

borderEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(borderName).swift",
                               contents: borderEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Opacity
let opacityName = String(describing: type(of: tokens.opacity))
var opacityEnum = """
import UIKit

public enum \(opacityName) {\n
"""

tokens.opacity.options.forEach { (key, attribute) in
    opacityEnum += "    public static let \(key): CGFloat = \(attribute.value)\n"
}

opacityEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(opacityName).swift",
                               contents: opacityEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Shadow
let shadowName = String(describing: type(of: tokens.shadow))
var shadowEnum = """
import UIKit

public enum \(shadowName) {\n
"""

tokens.shadow.options.forEach { (key, value) in
    shadowEnum += "    case level\(key)\n"
}

shadowEnum += "\n    public var offset: CGSize {\n"
shadowEnum += "        switch self {\n"

tokens.shadow.options.forEach { (key, value) in
    shadowEnum += "        case .level\(key):\n"
    shadowEnum += "            return CGSize(width: \(value.horizontal.value.numbers), height: \(value.vertical.value.numbers))\n"
}
shadowEnum += "        }\n"
shadowEnum += "    }\n"

shadowEnum += "\n    public var blur: CGFloat {\n"
shadowEnum += "        switch self {\n"

tokens.shadow.options.forEach { (key, value) in
    shadowEnum += "        case .level\(key):\n"
    shadowEnum += "            return \(value.blur.value.numbers)\n"
}
shadowEnum += "        }\n"
shadowEnum += "    }\n"

shadowEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(shadowName).swift",
                               contents: shadowEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Spacing
//let spacingName = String(describing: type(of: tokens.spacing))
//var spacingEnum = """
//import UIKit
//
//public enum \(spacingName) {\n
//"""
//
//tokens.spacing.options.forEach { (key, attribute) in
//    spacingEnum += "    public static let \(key): CGFloat = \(attribute.value.numbers)\n"
//}
//
//spacingEnum += "}\n"
//
//FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(spacingName).swift",
//                               contents: spacingEnum.data(using: .utf8),
//                               attributes: nil)

// MARK: - Spacing squish
//let spacingSquishName = String(describing: type(of: tokens.spacingSquish))
//var spacingSquishEnum = """
//import UIKit
//
//public enum \(spacingSquishName) {\n
//"""
//
//tokens.spacingSquish.options.enumerated().forEach { (index, item) in
//    spacingSquishEnum += "    public static let \(item.key) = NSDirectionalEdgeInsets(top: \(item.value.vertical.value.numbers), leading: \(item.value.horizontal.value.numbers), bottom: \(item.value.vertical.value.numbers), trailing: \(item.value.horizontal.value.numbers))\n"
//}
//
//spacingSquishEnum += "}\n"
//
//FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(spacingSquishName).swift",
//                               contents: spacingSquishEnum.data(using: .utf8),
//                               attributes: nil)

// MARK: - Radius
let radiusName = String(describing: type(of: tokens.radius))
var radiusEnum = """
import UIKit

public enum \(radiusName) {\n
"""

tokens.radius.options.forEach { (key, attribute) in
    radiusEnum += "    public static let \(key): CGFloat = \(attribute.value.numbers)\n"
}

radiusEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(radiusName).swift",
                               contents: radiusEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Font
let fontName = String(describing: type(of: tokens.font))
var fontEnum = """
import UIKit

public enum \(fontName)Size: CGFloat {\n
"""

tokens.font.sizes.forEach { (key, attribute) in
    fontEnum += "    case \(key) = \(attribute.value.numbers)\n"
}

fontEnum += "}\n\n"

fontEnum += "public enum \(fontName)Weight: Int, CaseIterable {\n"
tokens.font.weights.forEach { (key, attribute) in
    fontEnum += "    case \(key) = \(attribute.value)\n"
}
fontEnum += "}\n\n"

fontEnum += "public enum \(fontName)Family: String {\n"
tokens.font.families.forEach { (key, attribute) in
    fontEnum += "    case name = \"\(attribute.value.replacingOccurrences(of: "\'", with: ""))\"\n"
}
fontEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(fontName).swift",
                               contents: fontEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Line
let lineName = String(describing: type(of: tokens.line))
var lineEnum = """
import UIKit

public enum \(lineName) {\n
"""

tokens.line.options.forEach { (key, attribute) in
    let value = CGFloat(Int(attribute.value.numbers) ?? 0) / 100
    lineEnum += "    public static let \(key): CGFloat = \(value)\n"
}

lineEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(lineName).swift",
                               contents: lineEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Brand
let brandName = String(describing: type(of: tokens.brand))
var brandEnum = """
import UIKit

public enum \(brandName)Colors {\n
"""

tokens.brand.options.forEach { (key, attribute) in
    brandEnum += "    public static let color\(key): UIColor = UIColor(hex: \"\(attribute.value)\")\n"
}

brandEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(brandName)Colors.swift",
                               contents: brandEnum.data(using: .utf8),
                               attributes: nil)

// MARK: - Neutral
let neutralName = String(describing: type(of: tokens.neutral))
var neutralEnum = """
import UIKit

public enum \(neutralName)Colors {\n
"""

tokens.neutral.options.forEach { (key, attribute) in
    neutralEnum += "    public static let color\(key): UIColor = UIColor(hex: \"\(attribute.value)\")\n"
}

neutralEnum += "}\n"

FileManager.default.createFile(atPath: "../Sources/DesignSystem/Tokens/\(neutralName)Colors.swift",
                               contents: neutralEnum.data(using: .utf8),
                               attributes: nil)

extension String {
    var numbers: String {
        filter { "0"..."9" ~= $0 }
    }
}
