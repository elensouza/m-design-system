import UIKit

public enum Shadow {
    case level1
    case level2
    case level4
    case level3

    public var offset: CGSize {
        switch self {
        case .level1:
            return CGSize(width: 0, height: 4)
        case .level2:
            return CGSize(width: 0, height: 8)
        case .level4:
            return CGSize(width: 0, height: 16)
        case .level3:
            return CGSize(width: 0, height: 16)
        }
    }

    public var blur: CGFloat {
        switch self {
        case .level1:
            return 8
        case .level2:
            return 24
        case .level4:
            return 48
        case .level3:
            return 32
        }
    }
}
