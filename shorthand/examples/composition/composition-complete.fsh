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
* type = $LOINC#11503-0 "Medical Records"
* author = Reference(aupc-practitioner1)
* author.display = "John Doe"
* subject = Reference(aupc-patient1)
* subject.display = "Marcus Welby"

* date = "2020-04-21"

* section[medicalHistoryList].entry = Reference(aupc-medicalHistoryList)    //defined in condition+procedure-examples
* section[medicalHistoryList].code = $LOINC#11348-0 "Medical History"
* section[medicalHistoryList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Polio and asthma</div>"
* section[medicalHistoryList].text.status = #generated

* section[adverseReactionList].entry = Reference(aupc-adverseReactionList)  //defined allergyIntolerance-examples
* section[adverseReactionList].code = $LOINC#48765-2 "Adverse Reactions"
* section[adverseReactionList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Peanuts and others</div>"
* section[adverseReactionList].text.status = #generated

* section[vaccinationList].entry = Reference(aupc-immunizationList) //defined in immunizations-examples.fsh
* section[vaccinationList].code = $LOINC#41291-6 "Immunizations"
* section[vaccinationList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunizations</div>"
* section[vaccinationList].text.status = #generated

* section[medicineList].entry = Reference(aupc-medicineList) //defined in medication-examples.fsh
* section[medicineList].code = $LOINC#10160-0 "Medicine list"
* section[medicineList].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Medications</div>"
* section[medicineList].text.status = #generated

* section[familyHistory].entry = Reference(aupc-familyHistoryList) //defined in familyHistory-examples.fsh
* section[familyHistory].code = $LOINC#10157-6 "Family history list"
* section[familyHistory].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Father with diabetes</div>"
* section[familyHistory].text.status = #generated

//Doesn't refer to a List - multiple Observations
* section[pregnancyHistory].code = $LOINC#10163-4  "History of pregnancies"
* section[pregnancyHistory].text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>History of pregnancies</div>"
* section[pregnancyHistory].text.status = #generated
* section[pregnancyHistory].entry[0] = Reference(aupc-gravidity1) //defined in observation-examples.fsh
* section[pregnancyHistory].entry[1] = Reference(aupc-parity1) //defined in observation-examples.fsh
* section[pregnancyHistory].entry[2] = Reference(aupc-gestationOnScan1) //defined in observation-examples.fsh
* section[pregnancyHistory].entry[3] = Reference(aupc-edd1) //defined in observation-examples.fsh
* section[pregnancyHistory].entry[4] = Reference(aupc-lmp1) //defined in observation-examples.fsh







