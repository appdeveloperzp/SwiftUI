import SwiftUI
import Core

struct SettingsView: View {

    // MARK: - Properties -

    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        container
            .navigationTitle(Copy.Settings.navigationTitle.uppercased())
            .background()
    }

    // MARK: - Private -

    private var container: some View {
        CustomScrollView {
            LazyVStack {
                ForEach(0..<viewModel.sections.count,
                        id: \.self) { index in
                    let sectionModel = viewModel.sections[index]
                    SettingsSection(with: sectionModel,
                                    actionRowTapped: { settingsItem in
                        viewModel.executeAction(for: settingsItem)
                    })
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)

            logoutButton
                .padding(.top, 40)
                .bottomPadding(40)
        }
        .contactUs(shouldPresent: $viewModel.shouldPresentContactUs)
    }

    private var logoutButton: some View {
        Button {
            viewModel.showLogOutConfirmation()
        } label: {
            HStack(spacing: 7) {
                CustomImage(.logOut)
                CustomText(Copy.Settings.logOutButton,
                           font: .medium,
                           size: 14)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct SettingsViewPreviews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
