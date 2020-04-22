#!/usr/bin/env node
//create an example page containing all the examples in the Guide

let fs = require('fs')
let examplePath =  '../shorthand/examples'
let outFileName = '../shorthand/ig-data/input/pagecontent/examples.md';

//retrieve all the files 
let results = walk(examplePath)

let hashExamples = {};      //hash by InstanceOf: contains {id:, description:, title}

//let c = fs.readFileSync(results[0]).toString()
//processFile(c)

//process the files - build the hash hashExamples
results.forEach(function(fullFileName) {
    let contents = fs.readFileSync(fullFileName).toString()
   // console.log(contents)
   processFile(contents,fullFileName)

})

let arMD = []
arMD.push("### Examples by Type")
arMD.push("");
arMD.push("| Type | Id | Title | Description |")
arMD.push("| --- | --- | --- | --- |")


for (var key of Object.keys(hashExamples)) {
    
    hashExamples[key].forEach(function(summary){
        let linkId = summary.id
        if (summary.link) {
            linkId = "[" + summary.id + "](" + summary.link + ")"
        }

        

        arMD.push("| " + key + " | " + linkId + " | " + summary.title + " | " + summary.description + " |")

    })
   // arMD.push("");

}
let outContents = arMD.join('\n')
fs.writeFileSync(outFileName,outContents)

console.log(hashExamples)


//get all the 
function processFile(contents,fullFileName) {
    let splitter = "Instance:"
    //let arResults = []
    let arInstances = contents.split(splitter);     //the instances defined in this file

    arInstances.forEach(function(i) {       //check each instance

        let fileContents = splitter + i     //add back in the splitter
        //arResults.push(splitter + i)
        console.log(fileContents)
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
                summary.link = summary.baseType + "-" + summary.id + ".html"
            }
            
            hashExamples[summary.type] = hashExamples[summary.type] || []
            hashExamples[summary.type].push(summary);
        }


        console.log(summary)


        let newIntance 



//console.log(ar)




        console.log('---')
    })
   


}


//console.log(results)

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

