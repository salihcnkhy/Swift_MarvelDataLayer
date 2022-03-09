import XCTest
import NetworkLayer
import Combine
import Alamofire
import CryptoKit
import MarvelDomainLayer

@testable import MarvelDataLayer

final class MarvelDataLayerTests: XCTestCase {
    
    static let networkManager = NetworkManager(configuration: .default, interceptor: .interceptor(), eventMonitors: [TestEventMonitor()])
    static let characterApiRemote: CharacterApiRemoteProtocol = CharacterApiRemote(networkManager: networkManager, serviceProviderGroup: CharacterServiceProviderGroup(httpProperyProvider: MarvelHttpPropertyProvider()))
    let characterRepository: CharacterRepositoryProtocol = CharacterRepository(apiRemote: characterApiRemote)
    
    var cancellables = Set<AnyCancellable>()
    
    
    func testExample() throws {
        let expectation = expectation(description: "Sink")
        characterRepository.getCharacterList(with: CharacterListRequest(offset: 0, limit: 1, nameStartsWith: "Spider")).sink(receiveCompletion: { completion in
            switch completion {
                case .failure(let error):
                    print("ERROR", error)
                case .finished:
                    expectation.fulfill()
            }
        }, receiveValue: { (response) in
            print(response)
        }).store(in: &cancellables)
        waitForExpectations(timeout: 10)
    }
}

final class TestEventMonitor: EventMonitor {
    func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        print(request)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print(String(data: data, encoding: .utf8) ?? "SOME NIL")
    }
}

struct MarvelHttpPropertyProvider: HttpPropertyProviderProtocol {
    
    let privateAPIKey = "043babe1d073082979adfcbc83875f75fc40578e8"
    let publicAPIKey = "4b1f0997b147a27pbac7142f3145c0eee"
    
    func getBaseUrl() -> String {
        URLBase.prod.description
    }
    
    func getDefaultQueryParams() -> [URLQueryItem]? {
        let ts = Date().timeIntervalSince1970.description
        let hashStr = "\(ts)\(privateAPIKey)\(publicAPIKey)"
        let md5Hash = md5(string: hashStr)
        return [
            .init(name: "ts", value: ts),
            .init(name: "apikey", value: publicAPIKey),
            .init(name: "hash", value: md5Hash)
        ]
    }
    
    func md5(string: String) -> String {
        let digits = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digits.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
