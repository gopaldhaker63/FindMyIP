
import Foundation
import Combine
 class FindMyIPViewModel: ObservableObject {
     
     @Published var findMyIPModel : FindMyIPModel?
     @Published var isLoading = true

    // MARK: - Properties

    private var subscriptions: Set<AnyCancellable> = []
    private let aPIServices: FindMyIPDataProvider

     // MARK: - Initializers

     init(aPIServices: FindMyIPDataProvider = APIServices()) {
         self.aPIServices = aPIServices
     }
     
    func findMyIPData() {
        self.isLoading = true
        self.aPIServices.findMyIP()
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.isLoading = false
                 print(error)
                case .finished:
                    break
                }
            } receiveValue: {[weak self] value in
                guard let self = self else { return }
                self.isLoading = false
                findMyIPModel = value
                print("Response::\(value)")
            }
            .store(in: &subscriptions)
    }
}
