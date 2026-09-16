import Foundation
import CoreText
import CoreGraphics
import UIKit

public struct DesignSystem {
    public static func initialize() {
        DesignSystem.Theme.light.check()
        DesignSystem.Theme.dark.check()
        
        registerFonts()
    }
    
    /**
     * Manual registration for SPM Packages
     */
    private static func registerFonts() {
        let bundle: Bundle = .module
        let fonts: [DesignSystem.Text.Font] = [
            .inter(.bold),
            .inter(.semibold),
            .inter(.medium),
            .inter(.regular),
            .playfairDisplay(.bold),
            .playfairDisplay(.semibold),
            .playfairDisplay(.medium),
            .playfairDisplay(.regular),
        ]
        
        let fontUrls = fonts.compactMap {
            bundle.url(forResource: $0.name(), withExtension: $0.ext)
        }
        
        CTFontManagerRegisterFontURLs(fontUrls as CFArray, .process, true) { errors, done in
            print(">>> Handler for registering fonts. Done? \(done)")
            if let fontErrors = (errors as? [CFError]) {
                print(">>> Error casting")
                fontErrors.forEach { err in
                    print(">>> Error: \(err)")
                }
            }
            return done
        }
    }
}
