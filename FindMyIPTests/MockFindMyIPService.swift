
import Foundation
import Combine
import Alamofire
@testable import FindMyIP

class MockFindMyIPService : FindMyIPDataProvider{
    
//    var fetchResult: Result<FindMyIPModel, DemoError>?
    func findMyIP() -> AnyPublisher<FindMyIPModel, AFError> {
        let url = URL(string: "https://ipapi.co/json/")!
        return AF.request(url,
                          method: .get,
                          parameters: nil,
                          headers: nil
                          )
            .publishDecodable(type: FindMyIPModel.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
