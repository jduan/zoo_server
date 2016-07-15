namespace java com.fitbit.core.thrift.user.thriftjava

include "Core.thrift"

struct AuthenticatedUser {
  // The ID of the user performing the action
    1: optional Core.Id id

    // The name of the user performing the action
    2: optional string name
}
