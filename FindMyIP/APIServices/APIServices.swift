import Foundation
import Combine
import Alamofire

enum DemoError: Error {
    case BadURL
    case NoData
    case DecodingError
}

protocol FindMyIPDataProvider{
    func findMyIP() -> AnyPublisher<FindMyIPModel, AFError>
}

class APIServices: FindMyIPDataProvider{
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
