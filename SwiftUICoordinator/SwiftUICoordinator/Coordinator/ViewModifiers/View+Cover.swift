import SwiftUI

extension View {
    func cover<Item, Content>(
        item: Binding<Item?>,
        content: @escaping (Item) -> Content
    ) -> some View where Item: Identifiable, Content: View {
        ZStack(alignment: .center) {
            self
            if let wrappedItem = item.wrappedValue {
                content(wrappedItem).ignoresSafeArea()
            }
        }
    }
}
