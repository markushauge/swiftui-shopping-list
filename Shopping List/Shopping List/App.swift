import SwiftUI

struct Product {
    var name: String
}

struct ProductRow : View {
    @State var product: Product
    
    var body: some View {
        Text(product.name)
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
