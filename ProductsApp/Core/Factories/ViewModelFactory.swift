//
//  ViewModelFactory.swift
//  ProductsApp
//
//  Created by Brayan Munoz on 9/01/25.
//

class ViewModelFactory {
    
    static func makeMainTabBarViewModel() -> MainTabBarViewModel {
        let colorRepository = UserDefaultsColorRepository()
        let getBackgroundColorUseCase = GetBackgroundColorUseCase(repository: colorRepository)
        
        return MainTabBarViewModel(
            getBackgroundColorUseCase: getBackgroundColorUseCase
        )
    }
    
    static func makeMenuViewModel() -> MenuViewModel {
        let colorRepository = UserDefaultsColorRepository()
        let getBackgroundColorUseCase = GetBackgroundColorUseCase(repository: colorRepository)
        let setBackgroundColorUseCase = SetBackgroundColorUseCase(repository: colorRepository)
        
        return MenuViewModel(
            getBackgroundColorUseCase: getBackgroundColorUseCase,
            setBackgroundColorUseCase: setBackgroundColorUseCase
        )
    }
    
    static func makeProductsViewModel() -> ProductsViewModel {
        let networkManager = NetworkManager()
        let productsRepository = RemoteProductsRepository(networkManager: networkManager)
        let fetchProductsUseCase = FetchProductsUseCase(productsRepository: productsRepository)
        let fetchProductDetailUseCase = FetchProductDetailUseCase(productsRepository: productsRepository)
        
        return ProductsViewModel(
            fetchProductsUseCase: fetchProductsUseCase,
            fetchProductDetailUseCase: fetchProductDetailUseCase
        )
    }
}
