### Examples by Type

| Type | Id | Title | Description |
| --- | --- | --- | --- |
| [AUPrimaryCareAllergyIntolerance](StructureDefinition-AUPrimaryCareAllergyIntolerance.html) | [aupc-allergy1](AllergyIntolerance-aupc-allergy1.json.html) | Oesophagitis caused by dairy food | Oesophagitis caused by dairy food |
|  | [aupc-allergy2](AllergyIntolerance-aupc-allergy2.json.html) | Peanut allergy | Urticaria as a result of a Peanut allergy |
|  | [aupc-allergy3](AllergyIntolerance-aupc-allergy3.json.html) | Penicillin anaphylaxis | Penicillin anaphylaxis |
|  | [aupc-allergy4](AllergyIntolerance-aupc-allergy4.json.html) | Alpha blocker rash | A rash as a consequence to Alpha adrenergic blockers |
| [AUPrimaryCareComposition](StructureDefinition-AUPrimaryCareComposition.html) | [aupc-compositionAllergy](AllergyIntolerance-aupc-compositionAllergy.json.html) | Example composition with allergy data |  |
|  | [aupc-compositionComplete](AllergyIntolerance-aupc-compositionComplete.json.html) | Example composition with all sections populated |  |
|  | [aupc-compositionEmpty](Composition-aupc-compositionEmpty.json.html) | Example composition with no data |  |
| [AUPrimaryCareAllergyIntoleranceList](StructureDefinition-AUPrimaryCareAllergyIntoleranceList.html) | aupc-adverseReactionList | Allergy List |  |
|  | [aupc-adverseReactionList](List-aupc-adverseReactionList.json.html) | Allergy List |  |
|  | [aupc-adverseReactionEmpty](List-aupc-adverseReactionEmpty.json.html) | No significant history |  |
| [AUPrimaryCareCondition](StructureDefinition-AUPrimaryCareCondition.html) | [aupc-condition1](Condition-aupc-condition1.json.html) | Conformed diagnosis of Polio | Polio |
|  | [aupc-condition2](Condition-aupc-condition2.json.html) | Conformed diagnosis of Asthma | Asthma |
| [Patient](StructureDefinition-Patient.html) | [aupc-patient1](Patient-aupc-patient1.json.html) | Patient | Supporting patient for examples |
| [Practitioner](StructureDefinition-Practitioner.html) | [aupc-practitioner1](Practitioner-aupc-practitioner1.json.html) | Practitioner | Supporting practitioner for examples |
| [AUPrimaryCareMedicalHistoryList](StructureDefinition-AUPrimaryCareMedicalHistoryList.html) | [aupc-medicalHistoryEmpty](List-aupc-medicalHistoryEmpty.json.html) | No significant history |  |
| [AUPrimaryCareImmunisationList](StructureDefinition-AUPrimaryCareImmunisationList.html) | [aupc-immunizationEmpty](List-aupc-immunizationEmpty.json.html) | No significant history |  |
| [AUPrimaryCareMedicineList](StructureDefinition-AUPrimaryCareMedicineList.html) | [aupc-medicineListEmpty](List-aupc-medicineListEmpty.json.html) | No significant history |  |


### Documents

### [aupc-compositionAllergy](Composition-aupc-compositionAllergy.json.html)
*Patient with Alllergy list only*

|  | Section | Contents
| --- | --- | --- |
| Subject:[John Doe](Patient-aupc-patient1.json.html) | | |
| Author: [Marcus Welby](Practitioner-aupc-practitioner1.json.html) | | |
| Sections:  | | |
| | Medical History
| | [*List resource*](List-aupc-medicalHistoryEmpty.json.html)
| | | Section is empty
| | Adverse Reactions
| | [*List resource*](List-aupc-adverseReactionList.json.html)
| | | [Oesophagitis](AllergyIntolerance-aupc-allergy1.json.html)
| | | [Peanut allergy](AllergyIntolerance-aupc-allergy2.json.html)
| | | [Penicillin anaphylaxis](AllergyIntolerance-aupc-allergy3.json.html)
| | | [Rash to alpha blockers](AllergyIntolerance-aupc-allergy4.json.html)
| | Immunizations
| | [*List resource*](List-aupc-immunizationEmpty.json.html)
| | | Section is empty
| | Medication List
| | [*List resource*](List-aupc-medicineListEmpty.json.html)
| | | Section is empty



### [aupc-compositionComplete](Composition-aupc-compositionComplete.json.html)


|  | Section | Contents
| --- | --- | --- |
| Subject:[undefined](Patient-aupc-patient1.json.html) | | |
| Author: [undefined](Practitioner-aupc-practitioner1.json.html) | | |
| Sections:  | | |
| | undefined
| | [*List resource*](List-aupc-medicalHistoryList.json.html)
| | | [Polio](Condition-aupc-condition1.json.html)
| | undefined
| | [*List resource*](List-aupc-adverseReactionList.json.html)
| | | [Oesophagitis](AllergyIntolerance-aupc-allergy1.json.html)
| | | [Peanut allergy](AllergyIntolerance-aupc-allergy2.json.html)
| | | [Penicillin anaphylaxis](AllergyIntolerance-aupc-allergy3.json.html)
| | | [Rash to alpha blockers](AllergyIntolerance-aupc-allergy4.json.html)
| | undefined
| | [*List resource*](List-aupc-immunizationEmpty.json.html)
| | | Section is empty
| | undefined
| | [*List resource*](List-aupc-medicineListEmpty.json.html)
| | | Section is empty



### [aupc-compositionEmpty](Composition-aupc-compositionEmpty.json.html)


|  | Section | Contents
| --- | --- | --- |
| Subject:[undefined](Patient-aupc-patient1.json.html) | | |
| Author: [undefined](Practitioner-aupc-practitioner1.json.html) | | |
| Sections:  | | |
| | Medical History
| | [*List resource*](List-aupc-medicalHistoryEmpty.json.html)
| | | Section is empty
| | Adverse Reactions
| | [*List resource*](List-aupc-adverseReactionEmpty.json.html)
| | | Section is empty
| | Immunizations
| | [*List resource*](List-aupc-immunizationEmpty.json.html)
| | | Section is empty
| | Medication List
| | [*List resource*](List-aupc-medicineListEmpty.json.html)
| | | Section is empty

