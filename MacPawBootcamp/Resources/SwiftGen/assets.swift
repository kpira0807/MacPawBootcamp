// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let backgroundColor = ColorAsset(name: "BackgroundColor")
  internal static let borderColor = ColorAsset(name: "BorderColor")
  internal static let aircraft = ImageAsset(name: "Aircraft")
  internal static let antiAircraftGuns = ImageAsset(name: "Anti-AircraftGuns")
  internal static let armouredFightingVehicles = ImageAsset(name: "ArmouredFightingVehicles")
  internal static let armouredPersonnelCarriers = ImageAsset(name: "ArmouredPersonnelCarriers")
  internal static let artillerySupporVehicles = ImageAsset(name: "ArtillerySupporVehicles")
  internal static let commandPosts = ImageAsset(name: "CommandPosts")
  internal static let engineeringVehicles = ImageAsset(name: "EngineeringVehicles")
  internal static let helicopters = ImageAsset(name: "Helicopters")
  internal static let infantryFightingVehicles = ImageAsset(name: "Infantry Fighting Vehicles")
  internal static let infantryMobilityVehicles = ImageAsset(name: "InfantryMobilityVehicles")
  internal static let jammersAndDeceptionSystems = ImageAsset(name: "Jammers And Deception Systems")
  internal static let mineResistantAmbushProtected = ImageAsset(name: "MineResistantAmbushProtected")
  internal static let multipleRocketLaunchers = ImageAsset(name: "MultipleRocketLaunchers")
  internal static let navalShips = ImageAsset(name: "Naval Ships")
  internal static let noImage = ImageAsset(name: "No Image")
  internal static let radars = ImageAsset(name: "Radars")
  internal static let reconnaissanceUnmannedAerialVehicle = ImageAsset(name: "Reconnaissance Unmanned Aerial Vehicle")
  internal static let selfPropelledAntiAircraftGuns = ImageAsset(name: "Self-PropelledAnti-AircraftGuns")
  internal static let selfPropelledAntiTank = ImageAsset(name: "Self-PropelledAnti-Tank")
  internal static let selfPropelledArtillery = ImageAsset(name: "Self-PropelledArtillery")
  internal static let surfaceToAirMissileSystems = ImageAsset(name: "Surface-To-Air Missile Systems")
  internal static let tanks = ImageAsset(name: "Tanks")
  internal static let towedArtillery = ImageAsset(name: "TowedArtillery")
  internal static let trucksVehiclesAndJeeps = ImageAsset(name: "Trucks, Vehicles and Jeeps")
  internal static let unmannedCombatAerialVehicles = ImageAsset(name: "Unmanned Combat Aerial Vehicles")
  internal static let textColor = ColorAsset(name: "TextColor")
  internal static let textTitleColor = ColorAsset(name: "TextTitleColor")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
