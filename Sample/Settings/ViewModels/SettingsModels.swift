import Foundation

private typealias Localized = Copy.Settings

enum SettingsSectionType: CaseIterable {
    case account
    case info
    case support

    var title: String {
        switch self {
        case .account:
            return Localized.accountSectionTitle

        case .info:
            return Localized.infoSectionTitle

        case .support:
            return Localized.supportSectionTitle

        }
    }
}

enum SettingsItem: CaseIterable {
    case myOrders
    case personalInfo
    case accountSettings

    case contactUs
    case helpCenter
    case termsOfService
    case privacyPolicy
    case howToUse
    case rateApp
    case diagnosticsPage

    var title: String {
        switch self {
        case .myOrders:
            return Localized.myOrdersSettingsItem

        case .personalInfo:
            return Localized.personalInfoSettingsItem

        case .accountSettings:
            return Localized.accountSettingsSettingsItem

        case .contactUs:
            return Localized.contactUsSettingsItem

        case .helpCenter:
            return Localized.helpCenterSettingsItem

        case .termsOfService:
            return Localized.termsOfServiceSettingsItem

        case .privacyPolicy:
            return Localized.privacyPolicySettingsItem

        case .howToUse:
            return Localized.howToUseSettingsItem

        case .rateApp:
            return Localized.rateAppSettingsItem

        case .diagnosticsPage:
            return Localized.diagnosticsSettingsItem
        }
    }

    var rowType: SettingsRowType {
        switch self {
        case .contactUs,
                .rateApp:
            return .action

        default:
            return .navigation

        }
    }

    var navigationRoute: Route? {
        switch self {
        case .myOrders:
            return .myOrders(parent: .settings)

        case .personalInfo:
            return .personalInfo(displayMode: .view)

        case .accountSettings:
            return .accountSettings

        case .helpCenter:
            return .helpCenter

        case .termsOfService:
            return .termsAndConditions

        case .privacyPolicy:
            return .privacyPolicy

        case .howToUse:
            return .appUsageInfo

        case .diagnosticsPage:
            return .diagnosticPage

        default:
            return nil
        }
    }
}

struct SettingsSectionModel {
    let type: SettingsSectionType
    let items: [SettingsItem]
}

enum SettingsRowType {
    case action
    case navigation
}
