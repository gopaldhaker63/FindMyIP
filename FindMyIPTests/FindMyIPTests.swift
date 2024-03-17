
import XCTest
@testable import FindMyIP
import Combine

final class FindMyIPTests: XCTestCase {
    var viewModel : FindMyIPViewModel!
    var aPIservice: MockFindMyIPService!
    private var subscriptions: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        
    }
    func test_API_Failure(){
        aPIservice = MockFindMyIPService()
        let expectation = XCTestExpectation(description: "FindMyIP")
        viewModel = FindMyIPViewModel(aPIServices: aPIservice)
        aPIservice.findMyIP()
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                    break
                }
            } receiveValue: {[weak self] value in
                guard let self = self else { return }
                viewModel.findMyIPModel = value
            }
            .store(in: &subscriptions)
        
        wait(for: [expectation],timeout: 5)
        XCTAssertNil(viewModel.findMyIPModel)

    }
    func test_API_Success(){
        aPIservice = MockFindMyIPService()
        viewModel = FindMyIPViewModel(aPIServices: aPIservice)
        
        let expectation = XCTestExpectation(description: "FindMyIP")
        aPIservice.findMyIP()
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                 print(error)
                    expectation.fulfill()
                case .finished:
                    break
                }
            } receiveValue: {[weak self] value in
                guard let self = self else { return }
                viewModel.findMyIPModel = value
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation],timeout: 5)
        XCTAssertNotNil(viewModel.findMyIPModel)

    }

}
