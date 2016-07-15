namespace java com.fitbit.core.thrift.error.thriftjava

enum ErrorReason {
  INVALID_PARAMETER = 1
  BAD_REQUEST = 2
  INVALID_CREDENTIALS = 3
  INSUFFICIENT_PRIVILEGES = 4
  INSUFFICIENT_PERMISSIONS = 5
  BACKEND_ERROR = 6
  RESOURCE_NOT_FOUND = 7
  RESOURCE_ALREADY_EXISTS = 8
}

// Represents a single error.
struct ErrorEntry {
  // The typed reason for the error
  1: required ErrorReason reason

  // A description of the error. For example, "Rating value must be between 1 and 100".
  2: optional string message

  // This should identify the location of the error. For example, "food.rating".
  3: optional string location
}

// Represents a group of errors generally part of the same context. For example, a response
// may include an Error struct that lists several validation errors when processing the request.
struct Error {
  1: list<ErrorEntry> errors
}
