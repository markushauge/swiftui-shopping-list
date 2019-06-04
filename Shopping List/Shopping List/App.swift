import SwiftUI

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
    @State var products: [Product]
    
    var body: some View {
        List(products.identified(by: \.name)) { product in
            ProductRow(product: product)
        }
    }
}

struct App : View {
    @State var products: [Product] = [
        .init(name: "Milk"),
        .init(name: "Butter"),
        .init(name: "Eggs")
    ]
    
    var body: some View {
        NavigationView {
            ProductList(products: products)
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
