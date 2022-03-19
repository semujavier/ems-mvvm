//
//  SceneDelegate.swift
//  ems
//
//  Created by Javier Serrano Muñoz on 19/3/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = WidgetsViewController(
            viewModel: WidgetsViewModel(
                liveUseCase: DefaultGetLiveUseCase(
                    liveRepository: DefaultLiveRepository()),
                historicUseCase: DefaultGetHistoricUseCase(
                    historicRepository: DefaultHistoricRepository())))
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
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

