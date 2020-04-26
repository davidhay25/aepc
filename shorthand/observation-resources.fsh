// PROFILES 

Profile: AUPrimaryCareGravidity
Parent: Observation
Id: AUPrimaryCareObservation-gravidity
Title: "AU Primary Care Gravidity"
Description: "Represents the gravidity (number of pregnancies) of a female patient"
* ^url = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareObservation-gravidity"
* status = #final
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding 1..1
* code.coding contains graviditySnomed 1..1
* code.coding[graviditySnomed] = http://snomed.info/sct#161732006
* subject 1..1
* value[x] 1..1

Profile: AUPrimaryCareParity
Parent: Observation
Id: AUPrimaryCareObservation-parity
Title: "AU Primary Care Parity"
Description: "The number of births where the fetus is overr 24 weeks"
* ^url = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareObservation-parity"
* status = #final
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding 1..1
* code.coding contains paritySnomed 1..1
* code.coding[paritySnomed] = http://snomed.info/sct#364325004
* subject 1..1
* value[x] 1..1

Profile: GestationOnScan
Parent: Observation
Id: AUPrimaryCareObservation-GestationOnScan
Title: "Gestation On Scan"
Description: "The gestational age from an ultrasound scan"
* ^url = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareObservation-GestationOnScan"
* partOf ^slicing.discriminator.type = #profile
* partOf ^slicing.discriminator.path = "reference"
* partOf ^slicing.rules = #open
* partOf 1..1
//todo - referencing by profile doesn't seem to work...
* partOf contains ultrasoundScan 1..1
//* partOf[ultrasoundScan] only Reference(Procedure)
//* partOf[ultrasoundScan] only Reference(https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareProcedure-UltrasoundScanObstetric)
*  partOf[ultrasoundScan] only Reference(AUPrimaryCareProcedure-UltrasoundScanObstetric)

* status = #final
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding 1..1
* code.coding contains gestationSnomed 1..1
* code.coding[gestationSnomed] = http://snomed.info/sct#57036006
* subject 1..1
* subject only Reference(http://hl7.org/fhir/StructureDefinition/Patient)

* effective[x] 1..1  //dh - observation is meaningless without a perfromed data todo - in theory could get from procedurer


//todo - ?slice to quantity
* value[x] 1..1

Profile: ExpectedDateOfDelivery
Parent: Observation
Id: AUPrimaryCareObservation-EDD
Title: "Expected Date of Delivery"
Description: "The date that delivery is due. Method of estimation not specified."
* ^url = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareObservation-EDD"
* status = #final


// todo - generates a sushi error
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains sliceCoding 1..1
* code.coding[sliceCoding] from http://aehrc.com/valueset/expecteddateofdeliverytypes (required)


//* code.coding from http://aehrc.com/valueset/expecteddateofdeliverytypes (preferred)

* subject 1..1

Profile: LastNormalMenstrualPeriod
Parent: Observation
Id: AUPrimaryCareObservation-LNMP
Title: "Last Menstrual Period"
Description: "The date of the womand last normal menstrual period"
* ^url = "https://aehrc.com/fhir/StructureDefinition/AUPrimaryCareObservation-LNMP"
* status = #final
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding 1..1
* code.coding contains lnmpSnomed 0..1      //todo  - get a sushi error with 1..1
* code.coding[lnmpSnomed] = http://snomed.info/sct#248993009
* code.coding contains lnmpLoinc 0..1
* code.coding[lnmpLoinc] = http://loinc.org#8665-2
* subject 1..1
* value[x] 1..1

