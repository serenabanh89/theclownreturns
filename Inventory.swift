import SwiftUI

// Singleton Inventory Manager
final class InventoryManager: ObservableObject {
    static let shared = InventoryManager()
    
    @Published var items: [InventoryItem] = []
    
    private init() {
        // Initialize with some example items
        items = [
            InventoryItem(id: 1, name: "Sword", isActive: true, imageName: "sword"),
            InventoryItem(id: 2, name: "Shield", isActive: false, imageName: "shield"),
            InventoryItem(id: 3, name: "Potion", isActive: true, imageName: "potion")
        ]
    }
    
    // Append item if condition is true
    func append(item: InventoryItem) {
        if item.isActive {
            items.append(item)
        }
    }
    
    // Toggle item active state
    func toggleItem(id: Int) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isActive.toggle()
        }
    }
}

struct InventoryItem: Identifiable {
    let id: Int
    let name: String
    var isActive: Bool
    let imageName: String
}

// Reusable Inventory View
struct InventoryView: View {
    @ObservedObject private var inventory = InventoryManager.shared
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 1) {
                    ForEach(inventory.items) { item in
                        if item.isActive {
                            VStack {
                                Button(action: {
                                    inventory.toggleItem(id: item.id)
                                }) {
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .frame(width: geometry.size.width * 0.05, height: geometry.size.width * 0.05)
                                        .foregroundColor(.blue)
                                }
                                Text(item.name)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                        }
                    }
                }
                .padding()
            }
        }
        .frame(height: 150)
    }
}

