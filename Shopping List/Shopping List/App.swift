import SwiftUI

func gray(brightness: Double) -> Color {
    return Color(hue: 0, saturation: 0, brightness: brightness)
}

struct Product {
    var name: String
    var completed: Bool = false
}

struct ProductRow : View {
    @State var product: Product
    
    func handleClick() {
        product.completed = !product.completed
    }
    
    var body: some View {
        Button(action: handleClick) {
            HStack {
                Text(product.name)
                Spacer()
                
                if product.completed {
                    Text("Completed")
                        .color(.gray)
                }
            }
        }
    }
}

struct ProductList : View {
    @Binding var products: [Product]
    
    var body: some View {
        List(products.identified(by: \.name)) { product in
            ProductRow(product: product)
        }
    }
}

struct ProductAdd : View {
    let onAdd: (String) -> Void
    @State private var text: String = ""
    
    func handleClick() {
        onAdd(text)
        text = ""
    }
    
    var body: some View {
        HStack {
            TextField($text)
                .padding(10)
                .background(gray(brightness: 0.95), cornerRadius: 10)
            Button(action: handleClick) {
                Text("Add")
            }
        }
    }
}

struct App : View {
    @State var products: [Product] = []
    
    func handleAdd(name: String) {
        products.append(Product(name: name))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ProductAdd(onAdd: handleAdd)
                    .padding(20)
                ProductList(products: $products)
            }
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
