Instance: aupc-compositionComplete
InstanceOf: AUPrimaryCareComposition
//BaseType: AllergyIntolerance 
Title: "Example composition with all sections populated"
Description: """
The composition for a patient with an allergy list only. Other required sections are present with no data.
This shows ONLY required sectioons. 
"""
Usage: #Example

* status = #final
* type = http://loinc.org#11503-0 "Medical Records"
* author = Reference(aupc-practitioner1)
* subject = Reference(aupc-patient1)

* date = "2020-04-21"

* section[medicalHistoryList].entry = Reference(aupc-medicalHistoryList)    //defined bellow
* section[medicalHistoryList].code = http://loinc.org#11348-0
* section[medicalHistoryList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Polio</div>"
* section[medicalHistoryList].text.status = #generated

* section[adverseReactionList].entry = Reference(aupc-adverseReactionList)  //defined below
* section[adverseReactionList].code = http://loinc.org#48765-2
* section[adverseReactionList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Peanuts and others</div>"
* section[adverseReactionList].text.status = #generated

* section[vaccinationList].entry = Reference(aupc-immunizationEmpty) //defined in supporting.fsh
* section[vaccinationList].code = http://loinc.org#41291-6
* section[vaccinationList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No significant medical history</div>"
* section[vaccinationList].text.status = #generated

* section[medicineList].entry = Reference(aupc-medicineListEmpty) //defined in supporting.fsh
* section[medicineList].code = http://loinc.org#10160-0
* section[medicineList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>No significant medical history</div>"
* section[medicineList].text.status = #generated






Instance: aupc-adverseReactionList
InstanceOf: AUPrimaryCareAllergyIntoleranceList
//BaseType: List 
Title: "Allergy List"
Usage: #example

* mode = #snapshot
* status = #current
* subject = Reference(aupc-patient1)
* entry.item = Reference(aupc-allergy1)
* entry[1].item = Reference(aupc-allergy2)
* entry[2].item = Reference(aupc-allergy3)
* entry[3].item = Reference(aupc-allergy4)
