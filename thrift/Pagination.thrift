namespace java com.fitbit.core.thrift.pagination.thriftjava

// Used when making a request for a list of resources.
struct PaginationParams {
  // The page to fetch. If not provided the first page should be returned.
  1: optional string token

  // The number of results to return. This should be defaulted in the
  // interface implementation if not provided.
  2: optional i16 maxResults

  // The page number to fetch. This is used in connection with maxResults to find the subset of results to return.
  //
  // NOTE: This is here for backward compatibility purposes only. Page tokens should be opaque and owned by the service.
  // For example, when migrating to a new data store that does not support offset lookups well will break all clients because
  // the clients assume they can use offsets. It is strongly encouraged to avoid this field if possible and instead rely on passing
  // page tokens in the response which are then used in the request.
  3: optional i16 pageNumber
}

// Returned in the response with a list of resources.
struct PaginationInfo {
  // When provided it can be set on the request in PaginationParams.token to
  // specify the next page of results.
  1: optional string nextPageToken

  // When provided it can be set on the request in PaginationParams.token to
  // specify the previous page of results.
  2: optional string prevPageToken

  // The total number of results. This may not be populated in cases where it is
  // not known or expensive to calculate.
  3: optional i32 totalResults

  // A list of all pagination tokens for all pages of a list. This may not be
  // populated in cases where it is expensive to provide.
  4: optional list<string> paginationTokens
}