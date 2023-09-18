//
//  NetworkManager.swift
//  GraphQLImplementation
//
//  Created by ebpearls on 06/07/2023.
//

import Foundation
import Apollo
import GitHub

class NetworkManager {
    
    static var shared = NetworkManager()
    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        return ApolloClient(networkTransport: transport, store: store)
    }()
    
    private init() {}
    
    func fetchData<T: GraphQLQuery>(query: T, completion: @escaping (Result<T.Data, Error>) -> Void) {
        NetworkManager.shared.apollo.fetch(query: query) { result in
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

class AuthorizationInterceptor: ApolloInterceptor {
    var id: String = "nxxis"
    let token = "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"
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(request: request, response: response, interceptor: self, completion: completion)
    }
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
}



