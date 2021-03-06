//
//  FHIRServerRequestHandler.swift
//  SwiftSMART
//
//  Created by Pascal Pfiffner on 3/31/15.
//  2015, SMART Platforms.
//

import Foundation
#if !NO_MODEL_IMPORT
import Models
#endif


/**
    Base for different request/response handlers.

    Would love to make this a protocol but since it has an associated type it cannot be used nicely, hence a class.
 */
public class FHIRServerRequestHandler {
	
	/// The HTTP type of the request.
	public let type: FHIRRequestType
	
	/// The data to be used in the request body.
	public var data: NSData?
	
	/// The receiver may hold on to a resource that supplies the request's body data.
	public var resource: Resource?
	
	public init(_ type: FHIRRequestType, resource: Resource? = nil) {
		self.type = type
		self.resource = resource
	}
	
	public func prepareData() throws {
		if nil == resource {
			return
		}
		throw FHIRError.RequestCannotPrepareBody
	}
	
	/**
	    Give the request type a chance to prepare/alter the URL request.
	
	    Typically the FHIRRequestType instance sets the correct HTTPMethod as well as correct FHIR headers.
	 */
	public func prepareRequest(req: NSMutableURLRequest) throws {
		try prepareData()
		type.prepareRequest(req, body: data)
	}
	
	public class var ResponseType: FHIRServerResponse.Type {
		return FHIRServerDataResponse.self
	}
	
	/**
	    Instantiate an object of ResponseType-type based on the response and data that we get.
	 */
	public func response(response response: NSURLResponse?, data inData: NSData? = nil, error: NSError? = nil) -> FHIRServerResponse {
		if let res = response {
			return self.dynamicType.ResponseType.init(response: res, data: inData, urlError: error)
		}
		if let error = error {
			return self.dynamicType.ResponseType.init(error: error)
		}
		return self.dynamicType.ResponseType.noneReceived()
	}
	
	/**
	Convenience method to indicate a request that has not actually been sent.
	*/
	public func notSent(reason: String) -> FHIRServerResponse {
		return self.dynamicType.ResponseType.init(error: FHIRError.RequestNotSent(reason))
	}
	
	/**
	Convenience method to indicate that no request handler for the given type is available.
	*/
	public class func noneAvailableForType(type: FHIRRequestType) -> FHIRServerResponse {
		return ResponseType.init(error: FHIRError.NoRequestHandlerAvailable(type.rawValue))
	}
}


/**
    Prepare and handle a request returning JSON data.

    JSON body data can be greated from the resource, if the receiver holds on to one.
 */
public class FHIRServerJSONRequestHandler: FHIRServerRequestHandler {
	
	public var json: FHIRJSON?
	
	
	override public func prepareData() throws {
		if nil != data {
			return
		}
		if nil == json {
			json = resource?.asJSON()
		}
		if let json = json {
			data = try NSJSONSerialization.dataWithJSONObject(json, options: [])
		}			// for GET requests we don't have data, which is fine too
	}
	
	public override func prepareRequest(req: NSMutableURLRequest) throws {
		try super.prepareRequest(req)
		req.setValue("application/json+fhir", forHTTPHeaderField: "Accept")
		switch type {
		case .PUT:
			req.setValue("application/json+fhir; charset=utf-8", forHTTPHeaderField: "Content-Type")
		case .POST:
			req.setValue("application/json+fhir; charset=utf-8", forHTTPHeaderField: "Content-Type")
		default:
			break
		}
	}
	
	public override class var ResponseType: FHIRServerResponse.Type {
		return FHIRServerJSONResponse.self
	}
}


/**
    PRELIMINARY! Prepare and handle a request returning some type of data.

    If you use this as PUT/POST, you are responsible for setting the `data` property to an appropriate NSData representation.
*/
public class FHIRServerDataRequestHandler: FHIRServerRequestHandler {
	
	public let contentType: String
	
	init(_ type: FHIRRequestType, contentType: String) {
		self.contentType = contentType
		super.init(type, resource: nil)
	}
	
	override public func prepareData() throws {
	}
	
	public override func prepareRequest(req: NSMutableURLRequest) throws {
		try super.prepareRequest(req)
		switch type {
		case .GET:
			req.setValue(contentType, forHTTPHeaderField: "Accept")
		case .PUT:
			// TODO: make useful for PUT/POST (by setting correct "Accept" headers) and implement error handling (i.e. OperationOutcome) for GET requests
			req.setValue(contentType, forHTTPHeaderField: "Content-Type")
		case .POST:
			req.setValue(contentType, forHTTPHeaderField: "Content-Type")
		default:
			break
		}
	}
	
	public override class var ResponseType: FHIRServerResponse.Type {
		return FHIRServerDataResponse.self
	}
}

