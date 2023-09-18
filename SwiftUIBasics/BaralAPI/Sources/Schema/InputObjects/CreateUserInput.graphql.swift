// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CreateUserInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    username: String,
    email: String,
    password: String
  ) {
    __data = InputDict([
      "username": username,
      "email": email,
      "password": password
    ])
  }

  public var username: String {
    get { __data["username"] }
    set { __data["username"] = newValue }
  }

  public var email: String {
    get { __data["email"] }
    set { __data["email"] = newValue }
  }

  public var password: String {
    get { __data["password"] }
    set { __data["password"] = newValue }
  }
}
