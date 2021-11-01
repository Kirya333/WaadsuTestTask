//
//  SceneDelegate.swift
//  TestAppForWaadsu
//
//  Created by Кирилл Тарасов on 02.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
//     Здесь сделал инъекцию зависимостей и создал объекты, лучше делать это в отдельном объекте например в Builder
     
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let waadsuAPI = WaadsuAPI()
        let view = MapViewController()
        let presenter = Presenter(view: view, waadsuAPI: waadsuAPI)
        
        view.presenter = presenter
        
        window.rootViewController = view
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

