import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?

    private var isSelected: Bool {
        return selectedOption == option
    }

    var body: some View {
        HStack {
            Image(systemName: option.systemNameImage)
                .imageScale(.small)
            Text(option.title)
                .font(.subheadline)
            Spacer()
        }
        .padding(.leading)
        .foregroundColor(isSelected ? .blue:.primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .blue.opacity(0.15): .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
     
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(option: .dashboard, selectedOption: .constant(.dashboard))
    }
}
