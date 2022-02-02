import UIKit

class BarButtonItem: UIBarButtonItem {
    private var _action: () -> Void
    
    init(image: UIImage, action: @escaping () -> Void) {
        _action = action
        super.init()
        
        self.image = image
        self.action = #selector(fire)
        target = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func fire() {
        _action()
    }
}
