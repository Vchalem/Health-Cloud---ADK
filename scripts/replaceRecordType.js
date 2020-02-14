var fs = require("fs");

const object = process.argv.slice(2);
let mapRecordTypes = new Map();

var recTypes = require(`../data/preprocess/${object}RecordTypes.json`);
var objectData = require(`../data/preprocess/${object}.json`);

recTypes.result.records.forEach(record => {
  mapRecordTypes.set(record.DeveloperName, record.Id);
});

objectData.records.forEach(record => {
    if (mapRecordTypes.has(record.RecordTypeId)) {
      record.RecordTypeId = mapRecordTypes.get(record.RecordTypeId);
    }
});

try {
  fs.writeFileSync(`./data/${object}.json`, JSON.stringify(objectData, null, 2));
} catch (err) {
  console.log(err);
}
