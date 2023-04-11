import UIKit

public enum SpacingSquish {
    case xs
    case sm
    case quarck
    case nano

    public var edges: UIEdgeInsets {
        switch self {
        case .xs:
            return UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        case .sm:
            return UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
        case .quarck:
            return UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        case .nano:
            return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        }
    }
}
