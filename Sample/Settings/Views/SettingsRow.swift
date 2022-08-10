import SwiftUI

struct SettingsRow: View {

    // MARK: - Properties -
    private let viewModel: SettingsRowViewModel

    // MARK: - Life Cycle -
    init(with item: SettingsItem,
         shouldShowSeparator: Bool = true,
         actionRowTapped: SettingsItemTappedBlock?) {
        viewModel = SettingsRowViewModel(with: item,
                                         shouldShowSeparator: shouldShowSeparator,
                                         actionRowTapped: actionRowTapped)
    }

    var body: some View {
        mainContainer
    }

    // MARK: - Private -

    private var mainContainer: some View {
        switch viewModel.item.rowType {
        case .action:
            return Button {
                viewModel.executeActionIfNeeded()
            } label: {
                container
            }
            .eraseToAnyView()
        case .navigation:
            return navigationRow
                .eraseToAnyView()
        }
    }

    private var navigationRow: some View {
        if let route = viewModel.item.navigationRoute {
            return container
                .navigate(to: route)
                .eraseToAnyView()
        } else {
            return container
                .eraseToAnyView()
        }
    }

    private var container: some View {
        VStack(spacing: 16) {
            horizontalContainer
            if viewModel.shouldShowSeparator {
                separator
            }
        }
    }

    private var horizontalContainer: some View {
        HStack {
            CustomText(viewModel.item.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            if viewModel.item.rowType == .navigation {
                CustomImage(.settingsRightArrow)
            }
        }
    }

    private var separator: some View {
        Divider()
            .background(Colors.primary.just().opacity(0.8))
    }
}
