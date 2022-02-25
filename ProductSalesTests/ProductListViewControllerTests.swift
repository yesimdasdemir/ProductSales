//
//  ProductListViewControllerTests.swift
//  ProductListViewControllerTests
//
//  Created by Yeşim Daşdemir on 23.02.2022.
//

import XCTest
@testable import ProductSales

final class ProductListViewControllerTests: XCTestCase {
    var sut: ProductListViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setup()
    }
    
    override func tearDown() {
        window = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setup() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "ProductList", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Spy
    
    final class ProductListBusinessLogicSpy: ProductListBusinessLogic {
        var getProductListCalled = false
        
        func getProductList(pageNo: Int) {
            getProductListCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = ProductListBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertNotNil(window)
    }
    
    
    func testViewDidLoad() {
        // Given
        let spy = ProductListBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertNotNil(sut.collectionView)
        XCTAssertNotNil(sut.searchController)
        XCTAssertEqual(sut.navigationItem.title, "Sales Product List")
        XCTAssert(spy.getProductListCalled)
    }
    
    func testDisplayProductList() {
        // When
        sut.displayProductList(viewModel: ProductSales.GetProductList.ViewModel(simpleItemViewModel: [SimpleItemViewModel(id: 1,
                                                                                                                          title: "Apple",
                                                                                                                          subTitle: "iPhone 12",
                                                                                                                          imageWidth: "300",
                                                                                                                          imageLink: nil)],
                                                                                pageNo: 0))
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: { [weak self] in
            XCTAssertEqual(self?.sut.collectionView.numberOfItems(inSection: 0), 1)
        })
    }
    
    func testLoadMoreData() {
        // Given
        let spy = ProductListBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        sut.collectionView(sut.collectionView, willDisplay: sut.collectionView.visibleCells.last ?? UICollectionViewCell(), forItemAt: IndexPath(row: 1, section: 0))
        
        // ThenU
        XCTAssert(spy.getProductListCalled)
    }
}
