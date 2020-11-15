import Foundation
import RxSwift
import Network

protocol InvesmentSimulatorServiceType {
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail>
}

final class InvesmentSimulatorService: InvesmentSimulatorServiceType {
    
    // MARK: - Private properties
    
    private let network: ReactiveNetworkAdapterType

    // MARK: - Initializers
    
    init(network: ReactiveNetworkAdapterType = NetworkAdapter()) {
        
        self.network = network
    }
    
    // MARK: - Public methods
    
    func simulate(with parameters: InvestmentSimulationParameters) -> Observable<InvestmentDetail> {
        
        let endpoint = Endpoint(
            httpMethod: .get,
            urlString: "https://api-simulator-calc.easynvest.com.br/calculator/simulate")
        let parameters: [String : Any] = [
            "investedAmount": parameters.amount,
            "index": "CDI",
            "rate": parameters.performance,
            "isTaxFree": false,
            "maturityDate": parameters.expirationDate.backendString
        ]
        let request = NetworkRequest(endpoint: endpoint, parameters: parameters)
        
        return network.call(request).flatMap { $0.decoded() }
    }
}
