//
//  NetworkLayer.swift
//  SocialNetwork
//
//  Created by ebpearls on 03/08/2023.
//

import SwiftUI
import Apollo
import SocialNetworkAPI

class NetworkLayer {
    static let shared = NetworkLayer()
    @ObservedObject var loginViewModel = LoginViewModel()
    
    /// another test for Git
    
    lazy var apollo: ApolloClient = {
        let url = URL(string: "https://c35a-202-166-198-75.ngrok-free.app/graphql")!
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let client = URLSessionClient()
        
        let authInterceptor = UserAuthInterceptor(id: loginViewModel.accessToken ?? "")
        let networkInterceptorProvider = NetworkInterceptorsProvider(interceptors: [authInterceptor], store: store)
        
        return ApolloClient(networkTransport: RequestChainNetworkTransport(
            interceptorProvider: networkInterceptorProvider,
            endpointURL: url
        ), store: store)
    }()
    
    private init() {}
    
    func fetchData<T: GraphQLQuery>(query: T, completion: @escaping (Result<T.Data, Error>) -> Void) {
        apollo.fetch(query: query, cachePolicy: .returnCacheDataAndFetch) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                } else if let errors = graphQLResult.errors {
                    let error = NSError(domain: "GraphQL", code: 0, userInfo: [NSLocalizedDescriptionKey: errors.description])
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

class UserAuthInterceptor: ApolloInterceptor {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation: GraphQLOperation {
        request.addHeader(name: "Authorization", value: "Bearer \(id)")
        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}

class NetworkInterceptorsProvider: DefaultInterceptorProvider {
    
    let interceptors: [ApolloInterceptor]
    
    init(interceptors: [ApolloInterceptor], store: ApolloStore) {
        self.interceptors = interceptors
        super.init(store: store)
    }
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        self.interceptors.forEach { interceptor in
            interceptors.insert(interceptor, at: 0)
        }
        return interceptors
    }
}
