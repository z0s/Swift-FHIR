//
//  ImmunizationTests.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2015-11-24.
//  2015, SMART Health IT.
//

import XCTest
import SwiftFHIR


class ImmunizationTests: XCTestCase
{
	func instantiateFrom(filename filename: String) throws -> Immunization {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json json: FHIRJSON) -> Immunization {
		let instance = Immunization(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testImmunization1() {
		let instance = try? runImmunization1()
		XCTAssertNotNil(instance, "Must instantiate Immunization")
		if let instance = instance {
			try! runImmunization1(instance.asJSON())
		}
	}
	
	func runImmunization1(json: FHIRJSON? = nil) throws -> Immunization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "immunization-example-refused.json")
		
		XCTAssertEqual(inst.date!.description, "2013-01-10")
		XCTAssertEqual(inst.explanation!.reasonNotGiven![0].coding![0].code!, "MEDPREC")
		XCTAssertEqual(inst.explanation!.reasonNotGiven![0].coding![0].display!, "medical precaution")
		XCTAssertEqual(inst.explanation!.reasonNotGiven![0].coding![0].system!.absoluteString, "http://hl7.org/fhir/v3/ActReason")
		XCTAssertEqual(inst.id!, "notGiven")
		XCTAssertEqual(inst.patient!.reference!, "Patient/example")
		XCTAssertFalse(inst.reported!)
		XCTAssertEqual(inst.status!, "completed")
		XCTAssertEqual(inst.text!.status!, "generated")
		XCTAssertEqual(inst.vaccineCode!.coding![0].code!, "01")
		XCTAssertEqual(inst.vaccineCode!.coding![0].display!, "DTP")
		XCTAssertEqual(inst.vaccineCode!.coding![0].system!.absoluteString, "http://hl7.org/fhir/sid/cvx")
		XCTAssertTrue(inst.wasNotGiven!)
		
		return inst
	}
	
	func testImmunization2() {
		let instance = try? runImmunization2()
		XCTAssertNotNil(instance, "Must instantiate Immunization")
		if let instance = instance {
			try! runImmunization2(instance.asJSON())
		}
	}
	
	func runImmunization2(json: FHIRJSON? = nil) throws -> Immunization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "immunization-example.json")
		
		XCTAssertEqual(inst.date!.description, "2013-01-10")
		XCTAssertEqual(inst.doseQuantity!.code!, "mg")
		XCTAssertEqual(inst.doseQuantity!.system!.absoluteString, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.doseQuantity!.value!, NSDecimalNumber(string: "5"))
		XCTAssertEqual(inst.encounter!.reference!, "Encounter/example")
		XCTAssertEqual(inst.expirationDate!.description, "2015-02-15")
		XCTAssertEqual(inst.explanation!.reason![0].coding![0].code!, "429060002")
		XCTAssertEqual(inst.explanation!.reason![0].coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.id!, "example")
		XCTAssertEqual(inst.identifier![0].system!.absoluteString, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier![0].value!, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234")
		XCTAssertEqual(inst.location!.reference!, "Location/1")
		XCTAssertEqual(inst.lotNumber!, "AAJN11K")
		XCTAssertEqual(inst.manufacturer!.reference!, "Organization/hl7")
		XCTAssertEqual(inst.note![0].text!, "Notes on adminstration of vaccine")
		XCTAssertEqual(inst.patient!.reference!, "Patient/example")
		XCTAssertEqual(inst.performer!.reference!, "Practitioner/example")
		XCTAssertEqual(inst.reaction![0].date!.description, "2013-01-10")
		XCTAssertEqual(inst.reaction![0].detail!.reference!, "Observation/example")
		XCTAssertTrue(inst.reaction![0].reported!)
		XCTAssertFalse(inst.reported!)
		XCTAssertEqual(inst.requester!.reference!, "Practitioner/example")
		XCTAssertEqual(inst.route!.coding![0].code!, "IM")
		XCTAssertEqual(inst.route!.coding![0].display!, "Injection, intramuscular")
		XCTAssertEqual(inst.route!.coding![0].system!.absoluteString, "http://hl7.org/fhir/v3/RouteOfAdministration")
		XCTAssertEqual(inst.site!.coding![0].code!, "LA")
		XCTAssertEqual(inst.site!.coding![0].display!, "left arm")
		XCTAssertEqual(inst.site!.coding![0].system!.absoluteString, "http://hl7.org/fhir/v3/ActSite")
		XCTAssertEqual(inst.status!, "completed")
		XCTAssertEqual(inst.text!.status!, "generated")
		XCTAssertEqual(inst.vaccinationProtocol![0].authority!.reference!, "Organization/hl7")
		XCTAssertEqual(inst.vaccinationProtocol![0].description_fhir!, "Vaccination Protocol Sequence 1")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseSequence!, UInt(1))
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatus!.coding![0].code!, "count")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatus!.coding![0].display!, "Counts")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatus!.coding![0].system!.absoluteString, "http://hl7.org/fhir/vaccination-protocol-dose-status")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatusReason!.coding![0].code!, "coldchbrk")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatusReason!.coding![0].display!, "Cold chain break")
		XCTAssertEqual(inst.vaccinationProtocol![0].doseStatusReason!.coding![0].system!.absoluteString, "http://hl7.org/fhir/vaccination-protocol-dose-status-reason")
		XCTAssertEqual(inst.vaccinationProtocol![0].series!, "Vaccination Series 1")
		XCTAssertEqual(inst.vaccinationProtocol![0].seriesDoses!, UInt(2))
		XCTAssertEqual(inst.vaccinationProtocol![0].targetDisease![0].coding![0].code!, "1857005")
		XCTAssertEqual(inst.vaccinationProtocol![0].targetDisease![0].coding![0].system!.absoluteString, "http://snomed.info/sct")
		XCTAssertEqual(inst.vaccineCode!.coding![0].code!, "FLUVAX")
		XCTAssertEqual(inst.vaccineCode!.coding![0].system!.absoluteString, "urn:oid:1.2.36.1.2001.1005.17")
		XCTAssertEqual(inst.vaccineCode!.text!, "Fluvax (Influenza)")
		XCTAssertFalse(inst.wasNotGiven!)
		
		return inst
	}
}
