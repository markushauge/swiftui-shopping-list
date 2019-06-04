import SwiftUI

struct App : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct App_Previews : PreviewProvider {
    static var previews: some View {
        App()
    }
}
#endif
