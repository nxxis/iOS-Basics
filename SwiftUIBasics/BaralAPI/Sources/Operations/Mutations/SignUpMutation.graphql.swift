// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SignUpMutation: GraphQLMutation {
  public static let operationName: String = "SignUp"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation SignUp($createUserInput: CreateUserInput!) { createUser(createUserInput: $createUserInput) { __typename email password username } }"#
    ))

  public var createUserInput: CreateUserInput

  public init(createUserInput: CreateUserInput) {
    self.createUserInput = createUserInput
  }

  public var __variables: Variables? { ["createUserInput": createUserInput] }

  public struct Data: BaralAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { BaralAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createUser", CreateUser.self, arguments: ["createUserInput": .variable("createUserInput")]),
    ] }

    public var createUser: CreateUser { __data["createUser"] }

    /// CreateUser
    ///
    /// Parent Type: `User`
    public struct CreateUser: BaralAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { BaralAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("email", String.self),
        .field("password", String.self),
        .field("username", String.self),
      ] }

      public var email: String { __data["email"] }
      public var password: String { __data["password"] }
      public var username: String { __data["username"] }
    }
  }
}
