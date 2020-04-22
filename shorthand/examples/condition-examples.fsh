
Instance: aupc-condition1
InstanceOf: AUPrimaryCareCondition
//BaseType: Condition
Description: "Polio"
Title: "Conformed diagnosis of Polio"

* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Polio</div>"

* clinicalStatus.coding.system =  "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active

* verificationStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"
* verificationStatus.coding.code = #confirmed

* category.coding.system = $SNOMED
* category.coding.code = #439401001

* code.coding.system = $SNOMED
* code.coding.code = #398102009

* onsetDateTime = "1913-03-05"

* asserter = Reference(aupc-practitioner1)
* subject = Reference(aupc-patient1)

