import UIKit
import CoreData
import DATAStack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)

        return window
    }()

    var dataStack: DATAStack = {
        let dataStack = DATAStack(modelName: "DataModel")
        dataStack.drop()

        return dataStack
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if let window = self.window {
            let bounds = UIScreen.mainScreen().bounds

            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 120, height: 120)
            layout.sectionInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
            layout.headerReferenceSize = CGSize(width: bounds.size.width, height: 60)

            let viewController = CollectionController(layout: layout, dataStack: self.dataStack)
            window.rootViewController = UINavigationController(rootViewController: viewController)
            window.makeKeyAndVisible()
        }
        
        return true
    }
}
