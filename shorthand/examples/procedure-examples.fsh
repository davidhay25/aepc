
Instance: aupc-procedureUltraSound
InstanceOf: Procedure //AUPrimaryCareProcedure-UltrasoundScanObstetric 
//BaseType: Procedure
Description: "Obstetric Ultrasound"
Title: "Obstetric Ultrasound"

* subject = Reference(aupc-patient1)
* status = #complete
* code.coding.code = #268445003
* code.coding.system = $SNOMED

* performedDateTime = "2020-01-01"

