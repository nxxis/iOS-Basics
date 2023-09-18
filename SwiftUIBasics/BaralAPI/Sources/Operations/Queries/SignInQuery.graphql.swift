// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SignInQuery: GraphQLQuery {
  public static let operationName: String = "SignIn"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SignIn($loginData: LoginInput!) { validateUser(loginData: $loginData) { __typename email username } }"#
    ))

  public var loginData: LoginInput

  public init(loginData: LoginInput) {
    self.loginData = loginData
  }

  public var __variables: Variables? { ["loginData": loginData] }

  public struct Data: BaralAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { BaralAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("validateUser", ValidateUser.self, arguments: ["loginData": .variable("loginData")]),
    ] }

    public var validateUser: ValidateUser { __data["validateUser"] }

    /// ValidateUser
    ///
    /// Parent Type: `UserType`
    public struct ValidateUser: BaralAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { BaralAPI.Objects.UserType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("email", String.self),
        .field("username", String.self),
      ] }

      public var email: String { __data["email"] }
      public var username: String { __data["username"] }
    }
  }
}
