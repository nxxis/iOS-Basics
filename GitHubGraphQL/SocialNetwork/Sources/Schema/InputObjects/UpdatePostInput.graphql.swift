// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct UpdatePostInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    title: GraphQLNullable<String> = nil,
    body: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "title": title,
      "body": body
    ])
  }

  public var title: GraphQLNullable<String> {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  public var body: GraphQLNullable<String> {
    get { __data["body"] }
    set { __data["body"] = newValue }
  }
}
