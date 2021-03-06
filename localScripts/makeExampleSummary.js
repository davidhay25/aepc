#!/usr/bin/env node
//create an example page containing all the examples in the Guide

let fs = require('fs')
let examplePath =  '../shorthand/examples'
let abBundleOutputFolder = ['../shorthand/build/input/examples/','../shorthand/ig-data/input/examples/'];            //where to save a bundle
let outFileName = '../shorthand/ig-data/input/pagecontent/examples.md';
let outFileName2 = '../shorthand/build/input/pagecontent/examples.md';      //also put a copy directly in the IG input - otherwise have to run sushi again
let bundleServer = "http://clinfhir.com/fhir/";          //root for full url
//retrieve all the files 
let results = walk(examplePath)

let hashExamples = {};      //hash by InstanceOf: contains {id:, description:, title}

//process the files - build the hash hashExamples
results.forEach(function(fullFileName) {
    let contents = fs.readFileSync(fullFileName).toString()
    processFile(contents,fullFileName)
})



//now iterate through hashExamples to build the summary
let arMD = []
arMD.push("### Examples by Type")
arMD.push("");
arMD.push("| Type | Id | Title | Description |")
arMD.push("| --- | --- | --- | --- |")


for (var key of Object.keys(hashExamples)) {
    let ctr = 0;
    hashExamples[key].forEach(function(summary){
        let linkId = summary.id
        if (summary.link) {
            linkId = "[" + summary.id + "](" + summary.link + ")"
        }

        //only display the key once...

        //let keyDisplay = key;
        let keyDisplay = "[" + key +"](StructureDefinition-" + key + ".html)"
        if (ctr > 0) {
            keyDisplay = ""
        }

        arMD.push("| " + keyDisplay + " | " + linkId + " | " + summary.title + " | " + summary.description + " |")
        ctr ++
    })
}

//now, build the Document based summary
//arMD.push("");
//arMD.push("");
//arMD.push("### Documents");


// -------------


let FhirExamplePath =  '../shorthand/build/input/examples/'
let hashResources = {};


//let bundle = {resourceType:"Bundle",entry:[]}
//build the hash of all FHIR exmple resources...
let list = fs.readdirSync(FhirExamplePath);
list.forEach(function(file) {
    if (file.indexOf('.json') > -1) {
        //console.log(file)
        let fullFileName = FhirExamplePath + file;
        let contents = fs.readFileSync(fullFileName).toString()

        let json = JSON.parse(contents,null,2)

        delete json.meta    //

        let ref = json.resourceType + "/" + json.id
        hashResources[ref] = json
        //bundle.entry.push({resource:json})
    }
    
   
})

//write out the cmplete bundle
//fs.writeFileSync("./bundle.json",JSON.stringify(bundle))

//look for compositions
let arALLCompositionMD = []
for (var key of Object.keys(hashResources)) {
    let resource = hashResources[key]
    //console.log(resource.resourceType)
    if (resource.resourceType == 'Composition') {
        //let ar = processComposition(resource)
       // console.log(ar)arMD.push("");
       arALLCompositionMD.push("");
       arALLCompositionMD = arALLCompositionMD.concat(processComposition(resource))
       arALLCompositionMD.push("");
       arALLCompositionMD.push("");
    }

}

//now assemble the page
let ar = arALLCompositionMD.concat(arMD)


let outContents = ar.join('\n')
//let outContents = arMD.join('\n')
fs.writeFileSync(outFileName,outContents)       //This is sushi ig-data
fs.writeFileSync(outFileName2,outContents)      //This is the IG input
    return

//process the composition resource
function processComposition(comp) {
    let arComposition = []
    let hashResourceInDoc = {};     //used to ensure no duplications in doc
    //the document bundle
    let bundle = {resourceType : "Bundle", id:comp.id, type: 'document', entry:[]}
    bundle.entry.push({resource:comp,fullUrl:bundleServer+comp.resourceType + "/" + comp.id})

    //a bundle must have a date and identifier
    
    bundle.identifier = comp.identifier;
    bundle.timestamp = new Date().toISOString();

    let compLink = "[" + comp.id +"](Composition-" + comp.id + ".json.html)"

    compLink += " [(Document bundle)](Bundle-"+  comp.id + ".json.html)"

    arComposition.push("### " + compLink)
    let text = ""
    if (comp.text && comp.text.div) {
        text = "*" + getDivText(comp.text.div) + "*"
    }
    
    arComposition.push(text)
    arComposition.push("");
    arComposition.push("|  | Section | Section references | List references")
    arComposition.push("| --- | --- | --- | --- |")

    //let lnk = comp.subject.reference.replace(
    let subjectLink = "[" + comp.subject.display +"](" + makeLinkFromReference(comp.subject.reference) + ".json.html)"
    arComposition.push("| Subject:"  +   subjectLink       + " | | |")

    //add the Patient resource to the bundle
    let patientResource = hashResources[comp.subject.reference]
    if (patientResource) {
        bundle.entry.push({resource:patientResource,fullUrl:bundleServer+patientResource.resourceType + "/" + patientResource.id})
    }

    comp.author.forEach(function(author){
        let authorLink = "[" + author.display +"](" + makeLinkFromReference(author.reference) + ".json.html)"
        arComposition.push("| Author: " + authorLink + " | | |")
        //now get the resource...
        let authorResource = hashResources[author.reference]
        if (authorResource) {
            bundle.entry.push({resource:authorResource,fullUrl:bundleServer+authorResource.resourceType + "/" + authorResource.id})
        }

    })

    arComposition.push("| Sections:  | | |")
    //add the sections
    comp.section.forEach(function(sect){
        let sectionDisplay=""
        sect.code.coding.forEach(function(coding){
            sectionDisplay += coding.display;
        })
        arComposition.push("| | " + sectionDisplay)      //the section header
        //now for the section contents
        sect.entry.forEach(function(entry){     //generally only 1
            let resource = hashResources[entry.reference]
            if (resource && resource.resourceType == 'List') {


                //bundle.entry.push({resource:resource})
                bundle.entry.push({resource:resource,fullUrl:bundleServer+resource.resourceType + "/" + resource.id})
                let listLink = "[*List resource*](List-"+ resource.id +".json.html)"
                arComposition.push("| | | " + listLink)      //the section header

                //retrieve the contents of the list and display each on a line
                if (resource.emptyReason) {
                    arComposition.push("| | | Section is empty")  
                } else {
                    //iterate through the list contents
                    resource.entry.forEach(function(entry){
                        let entryResource = hashResources[entry.item.reference]

                       // bundle.entry.push({resource:entryResource})
                       //only add each resource once
                       let key = entryResource.type + "/" + entryResource.id
                       if (! hashResourceInDoc[key]) {
                            bundle.entry.push({resource:entryResource,fullUrl:bundleServer+entryResource.resourceType + "/" + entryResource.id})
                            hashResourceInDoc[key] = true;
                       }
                        

                        let text = ""
                        if (entryResource.text) {
                            text = getDivText(entryResource.text.div)
                        }
                       
                        let link = entryResource.resourceType + '-' + entryResource.id + '.json.html'
                        let display = "[" + text + "](" + link + ")"

                        //arMD.push("| | | " + display)  
                        arComposition.push("| | | | " + display) 
                    })
                }
                
            } else {
                let text = getDivText(resource.text.div)
                let link = resource.resourceType + '-' + resource.id + '.json.html'
                let display = "[" + text + "](" + link + ")"

                arComposition.push("| | | " + display)  
                //arComposition.push("| | | | " + display) 

                bundle.entry.push({resource:resource,fullUrl:bundleServer+resource.resourceType + "/" + resource.id})


                //console.log("WARNING: Section " +sectionDisplay + " is not a list" )

            }
        })




    })

    //write out the bundles...
    abBundleOutputFolder.forEach(function(folderName) {
        let bundleName = folderName + "Bundle-" + bundle.id + '.json';
        fs.writeFileSync(bundleName,JSON.stringify(bundle)) 
    })


    console.log(bundle)

    return arComposition;


}

function makeLinkFromReference(ref) {
    let ar = ref.split('/')
    //console.log(ref,ar.join('-'))
    return ar.join('-')
}

function getDivText(text) {
    let g = text.indexOf('>')
    let g1 = text.indexOf("<",1)
    return text.substr(g+1,g1-g-1)
}





//get all the instance defintions in the file...
function processFile(contents,fullFileName) {
    let splitter = "Instance:"
    //let arResults = []
    let arInstances = contents.split(splitter);     //the instances defined in this file

    arInstances.forEach(function(i) {       //check each instance

        let fileContents = splitter + i     //add back in the splitter
        //arResults.push(splitter + i)
        //console.log(fileContents)
        let summary = {description:"",title:""}
        let ar = fileContents.split('\n')
        ar.forEach(function(lne){
            lne = lne.replace(/['"]+/g, '');        //get rid of all the quotes
            if (lne.substr(0,11) == 'InstanceOf:') {
                summary.type = lne.substr(12)
            } else if (lne.substr(0,9) == 'Instance:') {
                summary.id = lne.substr(10)
            } else if (lne.substr(0,11) == '//BaseType:') {
                summary.baseType = lne.substr(12).trim();
            }else if (lne.substr(0,6) == 'Title:') {
                summary.title = lne.substr(7)
            } else if (lne.substr(0,12) == 'Description:') {
                summary.description = lne.substr(13)
            }
        })

        if (summary.type && summary.id) {
            //summary.content = fileContents;
           
            summary.fileName = fullFileName
            if (summary.baseType) {
                summary.link = summary.baseType + "-" + summary.id + ".json.html"
            }
            
            hashExamples[summary.type] = hashExamples[summary.type] || []
            hashExamples[summary.type].push(summary);
        }


        console.log(summary.id)

    })
   


}



//get all the FSH files in the directory & descendents
function walk(dir) {
    let results = [];
    let list = fs.readdirSync(dir);
    list.forEach(function(file) {
        if (file.substr(0,1) !== '.') {     //ignore hidden files
            file = dir + '/' + file;
            let stat = fs.statSync(file);
            if (stat && stat.isDirectory()) { 
                /* Recurse into a subdirectory */
                results = results.concat(walk(file));
            } else { 
                //Is a file - add if a FSH file
                if (file.substr(file.length-4,4) =='.fsh') {
                    results.push(file); 
                }         
                               
            }
        }
        
    });
    return results;
}

