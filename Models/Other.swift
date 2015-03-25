//
//  Other.swift
//  SMART-on-FHIR
//
//  Generated from FHIR 0.4.0.4879 (http://hl7.org/fhir/StructureDefinition/Other) on 2015-03-25.
//  2015, SMART Platforms.
//

import Foundation


/**
 *  Resource for non-supported content.
 *
 *  Other is a conformant for handling resource concepts not yet defined for FHIR or outside HL7's scope of interest.
 */
public class Other: DomainResource
{
	override public class var resourceName: String {
		get { return "Other" }
	}
	
	/// Who created
	public var author: Reference?
	
	/// Kind of Resource
	public var code: CodeableConcept?
	
	/// When created
	public var created: Date?
	
	/// Business identifier
	public var identifier: [Identifier]?
	
	/// Identifies the
	public var subject: Reference?
	
	public convenience init(code: CodeableConcept?) {
		self.init(json: nil)
		if nil != code {
			self.code = code
		}
	}
	
	public required init(json: FHIRJSON?) {
		super.init(json: json)
		if let js = json {
			if let val = js["author"] as? FHIRJSON {
				self.author = Reference(json: val, owner: self)
			}
			if let val = js["code"] as? FHIRJSON {
				self.code = CodeableConcept(json: val, owner: self)
			}
			if let val = js["created"] as? String {
				self.created = Date(string: val)
			}
			if let val = js["identifier"] as? [FHIRJSON] {
				self.identifier = Identifier.from(val, owner: self) as? [Identifier]
			}
			if let val = js["subject"] as? FHIRJSON {
				self.subject = Reference(json: val, owner: self)
			}
		}
	}
	
	override public func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = Identifier.asJSONArray(identifier)
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
}

