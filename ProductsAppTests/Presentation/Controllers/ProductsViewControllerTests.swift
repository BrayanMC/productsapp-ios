//
//  ProductsViewControllerTests.swift
//  ProductsAppTests
//
//  Created by Brayan Munoz on 9/01/25.
//

import XCTest
@testable import ProductsApp

final class ProductsViewControllerTests: XCTestCase {
    
    private var sut: ProductsViewController!
    private var viewModel: MockProductsViewModel!
    private var spyNavigationController: SpyNavigationController!
    private var mockProductsRepository: MockProductsRepository!
    private var mockFetchProductsUseCase: MockFetchProductsUseCase!
    private var mockFetchProductDetailUseCase: MockFetchProductDetailUseCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockProductsRepository = MockProductsRepository()
        mockFetchProductsUseCase = MockFetchProductsUseCase(productsRepository: mockProductsRepository)
        mockFetchProductDetailUseCase = MockFetchProductDetailUseCase(productsRepository: mockProductsRepository)
        
        viewModel = MockProductsViewModel(
            fetchProductsUseCase: mockFetchProductsUseCase,
            fetchProductDetailUseCase: mockFetchProductDetailUseCase
        )
        
        sut = makeSUT()
        sut.viewModel = viewModel
        spyNavigationController = SpyNavigationController(rootViewController: sut)
        setRootViewController(spyNavigationController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        spyNavigationController = nil
        mockProductsRepository = nil
        mockFetchProductsUseCase = nil
        mockFetchProductDetailUseCase = nil
        try super.tearDownWithError()
    }

    func testProductsViewController_WhenNavigateToDetail_PresentsDetailViewController() throws {
        // Given
        let _ = try XCTUnwrap(sut.productsTableView, "The productsTableView is not connected to an IBOutlet")
        
        let category = Product.Category(id: 0, name: "", image: "", creationAt: "", updatedAt: "")
        let product = Product(id: 1, title: "", price: 0.0, description: "", images: [""], creationAt: "", updatedAt: "", category: category)
        
        // When
        sut.navigateToDetail(with: product)
        
        // Then
        guard let presentedNavController = spyNavigationController.presentedViewController as? UINavigationController,
              let _ = presentedNavController.topViewController as? ProductDetailViewController else {
            XCTFail("Expected ProductDetailViewController but got nil")
            return
        }
    }
    
    func testProductsViewController_WhenScrollViewDidScrollNearBottom_FetchesMoreProducts() throws {
        // Given
        let _ = try XCTUnwrap(sut.productsTableView, "The productsTableView is not connected to an IBOutlet")
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: 100, height: 1000)
        scrollView.contentOffset = CGPoint(x: 0, y: 900)
        scrollView.frame.size.height = 100
        
        // When
        sut.scrollViewDidScroll(scrollView)
        
        // Then
        XCTAssertTrue(viewModel.fetchProductsCalled)
    }

    /*
     func testProductsViewController_WhenCellForRowAt_CreatesConfiguredCell() throws {
         // Given
         let tableView = try XCTUnwrap(sut.productsTableView, "The productsTableView is not connected to an IBOutlet")
         
         let category = Product.Category(id: 0, name: "", image: "", creationAt: "", updatedAt: "")
         let product = Product(id: 1, title: "Test Product", price: 0.0, description: "", images: [""], creationAt: "", updatedAt: "", category: category)
         
         viewModel.products.value = [product]
         
         // When
         let cell: ProductCellView = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProductCellView
         cell.buildCell(with: product)
         
         // Then
         XCTAssertNotNil(cell)
         XCTAssertEqual(cell.selectedProduct?.title, "Test Product")
     }
     */
    
    private func setRootViewController(_ viewController: UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            XCTFail("Failed to get the key window")
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    private func makeSUT(
        file: StaticString = #file,
        line: UInt = #line
    ) -> ProductsViewController {
        let viewController = ProductsViewController.instantiateFromXib()
        return viewController
    }
}
