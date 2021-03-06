//
//  BodySiteTests.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2015-11-24.
//  2015, SMART Health IT.
//

import XCTest
import SwiftFHIR


class BodySiteTests: XCTestCase
{
	func instantiateFrom(filename filename: String) throws -> BodySite {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json json: FHIRJSON) -> BodySite {
		let instance = BodySite(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testBodySite1() {
		let instance = try? runBodySite1()
		XCTAssertNotNil(instance, "Must instantiate BodySite")
		if let instance = instance {
			try! runBodySite1(instance.asJSON())
		}
	}
	
	func runBodySite1(json: FHIRJSON? = nil) throws -> BodySite {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "bodysite-example.json")
		
		XCTAssertEqual(inst.code!.coding![0].code!, "53120007")
		XCTAssertEqual(inst.code!.coding![0].display!, "Arm")
		XCTAssertEqual(inst.code!.coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.code!.text!, "Arm")
		XCTAssertEqual(inst.description_fhir!, "front of upper left arm directly below the tattoo")
		XCTAssertEqual(inst.id!, "example")
		XCTAssertEqual(inst.identifier![0].system!.absoluteString, "http://www.acmehosp.com/bodysites")
		XCTAssertEqual(inst.identifier![0].use!, "official")
		XCTAssertEqual(inst.identifier![0].value!, "12345")
		XCTAssertEqual(inst.image![0].contentType!, "image/png;base64")
		XCTAssertEqual(inst.image![0].title!, "ARM")
		XCTAssertEqual(inst.modifier![0].coding![0].code!, "419161000")
		XCTAssertEqual(inst.modifier![0].coding![0].display!, "Unilateral left")
		XCTAssertEqual(inst.modifier![0].coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier![0].text!, "Left")
		XCTAssertEqual(inst.modifier![1].coding![0].code!, "261183002")
		XCTAssertEqual(inst.modifier![1].coding![0].display!, "Upper")
		XCTAssertEqual(inst.modifier![1].coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier![1].text!, "Upper")
		XCTAssertEqual(inst.modifier![2].coding![0].code!, "255549009")
		XCTAssertEqual(inst.modifier![2].coding![0].display!, "Anterior")
		XCTAssertEqual(inst.modifier![2].coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier![2].text!, "Anterior")
		XCTAssertEqual(inst.patient!.reference!, "Patient/example")
		XCTAssertEqual(inst.text!.status!, "generated")
		
		return inst
	}
}
