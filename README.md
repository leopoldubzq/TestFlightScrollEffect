# Dynamic Stretching Effect in SwiftUI

This project showcases a simple yet effective SwiftUI trick that adds a dynamic **stretching effect** to UI elements while scrolling. Inspired by the TestFlight app, this technique enhances the user experience with smooth, responsive transitions.

## 📱 Demo

<img src="https://github.com/user-attachments/assets/584a7eb7-39e5-4599-bfad-2724f81ca9bf" alt="Demo GIF" width="200" />


## 🚀 Key Concept

The core of this effect relies on dynamically adjusting the padding of UI components based on the scroll position. As the user scrolls down, the **spacing between views** increases smoothly, giving the interface a lightweight, modern feel.

## 🧩 Code Snippet

Here's a simplified version of the implementation:

```swift
@State private var scrollOffsetY: CGFloat = .zero

var body: some View {
    ScrollView {
        VStack {
            Text("App Title")
                .font(.title)
                .bold()
                .padding(.top, calculateExtraPadding())
            Button("Install") {}
                .padding(.top, calculateExtraPadding())
        }
        .frame(maxWidth: .infinity)
    }
    .onScrollGeometryChange(for: CGFloat.self, of: { proxy in
        proxy.contentOffset.y + proxy.contentInsets.top
    }, action: { _, newValue in
        scrollOffsetY = newValue
    })
}

private func calculateExtraPadding() -> CGFloat {
    max(0, -scrollOffsetY) * 0.15
}
```

### 🔍 How It Works
- **`scrollOffsetY`** tracks the current scroll position.
- **`calculateExtraPadding()`** adds dynamic padding based on the scroll offset.
- The more you scroll down, the more padding is added, creating the stretching effect.

---

Enjoy experimenting with SwiftUI and adding dynamic effects to your apps! 🚀

