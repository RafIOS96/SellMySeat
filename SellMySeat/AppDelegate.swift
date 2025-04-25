//
//  AppDelegate.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 07.04.25.
//

import UIKit
import CoreData
import FirebaseCrashlytics
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let navigationCon = StoryboardScene.Onboarding.baseNav.instantiate()
        self.appCoordinator = Coordinator()
        self.appCoordinator?.navigationController = navigationCon
        self.appCoordinator?.start()
        self.window!.rootViewController = navigationCon
        self.window!.makeKeyAndVisible()
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SellMySeat")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
