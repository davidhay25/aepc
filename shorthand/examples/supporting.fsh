//base examples used by others
//note that the BaseType: is used to create the link to the example in the IG so do't delete them!

//Aliases
Alias: $SNOMED = http://snomed.info/sct
Alias: $LOINC = http://loinc.org


Instance: aupc-patient1
InstanceOf: Patient
//BaseType: Patient 
Description: "Supporting patient for examples"
Title: "Patient"

* name.text = "John Doe"

Instance: aupc-practitioner1
InstanceOf: Practitioner
//BaseType: Practitioner 
Description: "Supporting practitioner for examples"
Title: "Practitioner"

* name.text = "Marcus Welby"


// ===========  empty Lists for Compositions...
Instance: aupc-medicalHistoryEmpty
InstanceOf: AUPrimaryCareMedicalHistoryList
//BaseType: List 
Title: "No significant history"
Usage: #example

* mode = #snapshot
* status = #current
* emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

//a list with a coupld of 
Instance: aupc-adverseReactionEmpty
InstanceOf: AUPrimaryCareAllergyIntoleranceList
//BaseType: List 
Title: "No significant history"
Usage: #example

* mode = #snapshot
* status = #current
* emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

Instance: aupc-immunizationEmpty
InstanceOf: AUPrimaryCareImmunisationList
//BaseType: List 
Title: "No significant history"
Usage: #example

* mode = #snapshot
* status = #current
* emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"

Instance: aupc-medicineListEmpty
InstanceOf: AUPrimaryCareMedicineList
//BaseType: List 
Title: "No significant history"
Usage: #example

* mode = #snapshot
* status = #current
* emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#nilknown "Nil Known"