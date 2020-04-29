

Instance: aupc-smoker1
InstanceOf: Observation
//BaseType: Observation
Description: "is a cigarette smoker"
Title: "Cigarette smoker"

* text.status = #additional
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cigarette smoker</div>"

* status = #complete
* subject = Reference(aupc-patient1)
* effectiveDateTime = "2020-04-01"

* code.coding.system = $SNOMED#65568007  "Cigarette smoker"

//The list that references all of the immunization resources 
Instance: aupc-socialHistoryList
InstanceOf: AUPrimaryCareSocialHistoryList
//BaseType: List 
Title: "Social History resources"
Usage: #example

* text.status = #additional
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Social history resources</div>"

* mode = #snapshot
* status = #current
* subject = Reference(aupc-patient1)
* entry.item = Reference(aupc-immunization1)
* entry[1].item = Reference(aupc-smoker1)
