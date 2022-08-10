import SwiftUI

struct SettingsSection: View {

    // MARK: - Properties -

    let viewModel: SettingsSectionViewModel

    // MARK: - Life Cycle -

    init(with model: SettingsSectionModel,
         actionRowTapped: SettingsItemTappedBlock?) {
        self.viewModel = SettingsSectionViewModel(with: model,
                                                  actionRowTapped: actionRowTapped)
    }

    var body: some View {
        container
    }

    // MARK: - Private -

    private var container: some View {
        LazyVStack(spacing: 16) {
            ForEach(viewModel.model.items.indices,
                 id: \.self) { index in
                if index == .zero {
                    VStack(alignment: .leading,
                           spacing: 16) {
                        CustomText(viewModel.model.type.title,
                                   font: .medium,
                                   size: 12,
                                   color: Colors.primary2.just())
                        row(at: index)
                    }
                    .padding(.top, 24)
                } else {
                    row(at: index)
                }
            }
        }

    }

    private func row(at index: Int) -> some View {
        let item = viewModel.item(at: index)
        return SettingsRow(with: item,
                           shouldShowSeparator: viewModel.shouldShowSeparator(at: index),
                           actionRowTapped: viewModel.actionRowTapped)
    }
}
