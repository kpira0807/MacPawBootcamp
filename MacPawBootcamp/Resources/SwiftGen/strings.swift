// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Days {
    /// Days
    internal static let title = L10n.tr("Localizable", "Days.Title", fallback: "Days")
    internal enum Title {
      /// Days Information
      internal static let name = L10n.tr("Localizable", "Days.Title.Name", fallback: "Days Information")
    }
  }
  internal enum Losses {
    internal enum Aaw {
      /// Anti aircraft warfares:
      internal static let title = L10n.tr("Localizable", "Losses.AAW.Title", fallback: "Anti aircraft warfares:")
    }
    internal enum Apc {
      /// Armored personnel carriers:
      internal static let title = L10n.tr("Localizable", "Losses.APC.Title", fallback: "Armored personnel carriers:")
    }
    internal enum Aircrafts {
      /// Aircrafts:
      internal static let title = L10n.tr("Localizable", "Losses.Aircrafts.Title", fallback: "Aircrafts:")
    }
    internal enum CruiseMissiles {
      /// Cruise missiles:
      internal static let title = L10n.tr("Localizable", "Losses.Cruise_Missiles.Title", fallback: "Cruise missiles:")
    }
    internal enum Drones {
      /// Drones:
      internal static let title = L10n.tr("Localizable", "Losses.Drones.Title", fallback: "Drones:")
    }
    internal enum FieldArtilleries {
      /// Field artilleries:
      internal static let title = L10n.tr("Localizable", "Losses.Field_Artilleries.Title", fallback: "Field artilleries:")
    }
    internal enum FuelTanks {
      /// Fuel tanks:
      internal static let title = L10n.tr("Localizable", "Losses.Fuel_Tanks.Title", fallback: "Fuel tanks:")
    }
    internal enum Helicopters {
      /// Helicopters:
      internal static let title = L10n.tr("Localizable", "Losses.Helicopters.Title", fallback: "Helicopters:")
    }
    internal enum Mrl {
      /// Multiple rocket launchers:
      internal static let title = L10n.tr("Localizable", "Losses.MRL.Title", fallback: "Multiple rocket launchers:")
    }
    internal enum MilitaryAutos {
      /// Military autos:
      internal static let title = L10n.tr("Localizable", "Losses.Military_Autos.Title", fallback: "Military autos:")
    }
    internal enum Naval {
      /// Naval ships:
      internal static let title = L10n.tr("Localizable", "Losses.Naval.Title", fallback: "Naval ships:")
    }
    internal enum Personnel {
      /// Personnel:
      internal static let title = L10n.tr("Localizable", "Losses.Personnel.Title", fallback: "Personnel:")
    }
    internal enum SpecialEquipment {
      /// Special equipment:
      internal static let title = L10n.tr("Localizable", "Losses.Special_Equipment.Title", fallback: "Special equipment:")
    }
    internal enum Tanks {
      /// Tanks:
      internal static let title = L10n.tr("Localizable", "Losses.Tanks.Title", fallback: "Tanks:")
    }
    internal enum Vft {
      /// Vehicles and fuel tanks:
      internal static let title = L10n.tr("Localizable", "Losses.VFT.Title", fallback: "Vehicles and fuel tanks:")
    }
  }
  internal enum LossesEquipment {
    /// Losses Equipment
    internal static let title = L10n.tr("Localizable", "Losses_Equipment.Title", fallback: "Losses Equipment")
    internal enum Title {
      /// Equipment
      internal static let name = L10n.tr("Localizable", "Losses_Equipment.Title.Name", fallback: "Equipment")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
