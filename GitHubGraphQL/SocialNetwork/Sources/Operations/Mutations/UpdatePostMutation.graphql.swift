// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdatePostMutation: GraphQLMutation {
  public static let operationName: String = "updatePost"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      mutation updatePost($id: ID!, $input: UpdatePostInput!) {
        updatePost(id: $id, input: $input) {
          __typename
          id
          body
        }
      }
      """#
    ))

  public var id: ID
  public var input: UpdatePostInput

  public init(
    id: ID,
    input: UpdatePostInput
  ) {
    self.id = id
    self.input = input
  }

  public var __variables: Variables? { [
    "id": id,
    "input": input
  ] }

  public struct Data: SocialNetwork.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("updatePost", UpdatePost?.self, arguments: [
        "id": .variable("id"),
        "input": .variable("input")
      ]),
    ] }

    public var updatePost: UpdatePost? { __data["updatePost"] }

    /// UpdatePost
    ///
    /// Parent Type: `Post`
    public struct UpdatePost: SocialNetwork.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SocialNetwork.Objects.Post }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", SocialNetwork.ID?.self),
        .field("body", String?.self),
      ] }

      public var id: SocialNetwork.ID? { __data["id"] }
      public var body: String? { __data["body"] }
    }
  }
}
