import UIKit

// MARK: - Gray

extension UIColor {

    public static var lightestGray: UIColor {
        return .init(hex: 0xC3CAC9)
    }

    public static var lightGray: UIColor {
        return .init(hex: 0xA8ABB5)
    }

    public static var mediumGray: UIColor {
        return .init(hex: 0x6A6C74)
    }

    public static var darkGray: UIColor {
        return .init(hex: 0x36373C)
    }
}

// MARK: - Green

extension UIColor {

    public static var primaryGreen: UIColor {
        return .init(hex: 0x38C8B3)
    }
}

// MARK: - Red

extension UIColor {

    public static var alertRed: UIColor {
        return .init(hex: 0xFF7268)
    }
}

// MARK: - Convenience initializers

extension UIColor {

    public convenience init(hex: Int, alpha: CGFloat = 1.0) {

        let redComponent = hex >> 16
        let greenComponent = hex >> 8
        let blueComponent = hex

        self.init(red: CGFloat(redComponent & 0xFF) / 255.0,
                  green: CGFloat(greenComponent & 0xFF) / 255.0,
                  blue: CGFloat(blueComponent & 0xFF) / 255.0,
                  alpha: alpha)
    }
}
