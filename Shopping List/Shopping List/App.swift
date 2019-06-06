import SwiftUI

func gray(brightness: Double) -> Color {
    return Color(hue: 0, saturation: 0, brightness: brightness)
}

struct Product {
    var name: String
    var checked: Bool
}

struct ProductRow : View {
    @State var product: Product

    func handleClick() {
        product.checked = !product.checked
    }

    var body: some View {
        Button(action: handleClick) {
            HStack {
                Text(product.name)

                if product.checked {
                    Spacer()
                    Text("✓")
                        .color(.gray)
                }
            }
        }
    }
}

struct ProductList : View {
    @State var products: [Product] = []
    
    func handleAdd(name: String) {
        products.append(Product(name: name, checked: false))
    }

    var body: some View {
        VStack {
            ProductAdd(onAdd: handleAdd)
                .padding()
            
            List(products.identified(by: \.name)) { product in
                ProductRow(product: product)
            }
            .focusable(true)
        }
    }
}

struct ProductAdd : View {
    let onAdd: (String) -> Void
    @State private var text: String = ""

    func handleClick() {
        if text.trimmingCharacters(in: .whitespaces).isEmpty {
            return
        }
        
        onAdd(text)
        text = ""
    }

    var body: some View {
        HStack {
            TextField($text, placeholder: Text("Product"))
                .padding(10)
                .background(gray(brightness: 0.95), cornerRadius: 10)
            
            Button(action: handleClick) {
                Text("Add")
            }
        }
    }
}

struct App : View {
    var body: some View {
        NavigationView {
            ProductList()
                .navigationBarTitle(Text("Shopping List"))
        }
    }
}

#if DEBUG
struct App_Previews : PreviewProvider {
    static var previews: some View {
        App()
    }
}
#endif
