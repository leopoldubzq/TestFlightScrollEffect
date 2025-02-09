import SwiftUI

struct AppsScreen: View {
    
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @State private var apps: [AppType] = AppType.allCases
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header
                ForEach(apps, id: \.self) { app in
                    appCell(app: app)
                        .onTapGesture {
                            coordinator.push(.appDetails(app))
                        }
                }
            }
        }
        .background(.black)
        .navigationTitle("Apps")
    }
    
    private func appCell(app: AppType) -> some View {
        HStack {
            Image(app.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                
            VStack(alignment: .leading) {
                Text(app.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Group {
                    Text(app.version)
                    Text(app.expiration)
                }
                .font(.caption)
                .foregroundStyle(Color.secondaryText)
            }
            .lineLimit(1)
            
            Spacer()
            
            Button {} label: {
                Text("Install")
                    .bold()
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(Color(.cellBackground))
                    .clipShape(.capsule)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.customBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
    
    private var header: some View {
        Text("Currently Testing")
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .foregroundStyle(.white)
    }
}

#Preview {
    @Previewable @StateObject var coordinator = NavigationCoordinator()
    NavigationStack(path: $coordinator.route) {
        AppsScreen()
            .environmentObject(coordinator)
            .navigationDestination(for: NavigationRoute.self) {
                coordinator.handleDestination($0)
                    .environmentObject(coordinator)
            }
    }
    .tint(.white)
}
