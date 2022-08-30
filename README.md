# Flatplant Barcodes

Sample ruby script using zbar to extract barcodes from images then fire off a request to GBIF & fish for specimen data.

## Requirements

- ZBar Bar Code Reader, [https://github.com/mchehab/zbar](https://github.com/mchehab/zbar); Installation: [https://visp.inria.fr/3rd_zbar/](https://visp.inria.fr/3rd_zbar/)
- [ImageMagick](https://imagemagick.org/) or [GraphicsMagick](http://www.graphicsmagick.org/)

### Example Execution

```
$ gem install mini_magick rest_client zbar
$ irb
> require "./barcode"
> barcode = Barcode.new(file_path: "Preview001.jpg")
> barcode.extract
=> ["CHR 605113 A", "01-01601413"]
> pp barcode.gbif
[{:offset=>0,
  :limit=>20,
  :endOfRecords=>true,
  :count=>1,
  :results=>
   [{:key=>1091160699,
     :datasetKey=>"df582950-3b58-11dc-8c19-b8a03c50a862",
     :publishingOrgKey=>"6b2f029b-7823-4b84-9c30-31ff364238fe",
     :installationKey=>"79214403-ef01-4407-9b02-4439cd3b78e1",
     :publishingCountry=>"NZ",
     :protocol=>"DWC_ARCHIVE",
     :lastCrawled=>"2022-07-31T13:19:11.780+00:00",
     :lastParsed=>"2022-07-31T13:28:45.964+00:00",
     :crawlId=>397,
     :hostingOrganizationKey=>"6b2f029b-7823-4b84-9c30-31ff364238fe",
     :extensions=>
      {:"http://rs.tdwg.org/dwc/terms/Identification"=>
        [{:"http://rs.tdwg.org/dwc/terms/taxonRank"=>"species",
          :"http://rs.tdwg.org/dwc/terms/kingdom"=>"Plantae",
          :"http://rs.tdwg.org/dwc/terms/class"=>"Magnoliopsida",
          :"http://rs.tdwg.org/dwc/terms/family"=>"Solanaceae",
          :"http://rs.tdwg.org/dwc/terms/specificEpithet"=>"dulcamara",
          :"http://rs.tdwg.org/dwc/terms/order"=>"Solanales",
          :"http://rs.tdwg.org/dwc/terms/scientificName"=>
           "Solanum dulcamara L.",
          :"http://rs.tdwg.org/dwc/terms/identifiedBy"=>"W.R. Sykes",
          :"http://rs.tdwg.org/dwc/terms/genus"=>"Solanum",
          :"http://rs.tdwg.org/dwc/terms/identificationID"=>"158031",
          :"http://rs.tdwg.org/dwc/terms/dateIdentified"=>"2004-01-12",
          :"http://rs.tdwg.org/dwc/terms/phylum"=>"Tracheophyta"}]},
     :basisOfRecord=>"PRESERVED_SPECIMEN",
     :occurrenceStatus=>"PRESENT",
     :taxonKey=>2932737,
     :kingdomKey=>6,
     :phylumKey=>7707728,
     :classKey=>220,
     :orderKey=>1176,
     :familyKey=>7717,
     :genusKey=>2928997,
     :speciesKey=>2932737,
     :acceptedTaxonKey=>2932737,
     :scientificName=>"Solanum dulcamara L.",
     :acceptedScientificName=>"Solanum dulcamara L.",
     :kingdom=>"Plantae",
     :phylum=>"Tracheophyta",
     :order=>"Solanales",
     :family=>"Solanaceae",
     :genus=>"Solanum",
     :species=>"Solanum dulcamara",
     :genericName=>"Solanum",
     :specificEpithet=>"dulcamara",
     :taxonRank=>"SPECIES",
     :taxonomicStatus=>"ACCEPTED",
     :iucnRedListCategory=>"NE",
     :dateIdentified=>"2004-01-12T00:00:00",
     :stateProvince=>"Canterbury Land District",
     :year=>2004,
     :month=>1,
     :day=>10,
     :eventDate=>"2004-01-10T00:00:00",
     :issues=>["INSTITUTION_MATCH_FUZZY", "COLLECTION_MATCH_FUZZY"],
     :modified=>"2009-03-22T21:43:38.000+00:00",
     :lastInterpreted=>"2022-07-31T13:28:45.964+00:00",
     :references=>"https://scd.landcareresearch.co.nz/Specimen/CHR_605113_A",
     :license=>"http://creativecommons.org/licenses/by/4.0/legalcode",
     :identifiers=>[],
     :media=>[],
     :facts=>[],
     :relations=>[],
     :gadm=>{},
     :institutionKey=>"4ffd9b7a-c41f-41c1-b612-7c0c46aa6264",
     :collectionKey=>"f656e84f-12b2-461a-b128-dd58fb9104d8",
     :isInCluster=>false,
     :identifiedBy=>"W.R. Sykes",
     :inCluster=>false,
     :class=>"Magnoliopsida",
     :countryCode=>"NZ",
     :recordedByIDs=>[],
     :identifiedByIDs=>[],
     :country=>"New Zealand",
     :rightsHolder=>"Landcare Research NZ Ltd.",
     :identifier=>"46F21423-2C66-4972-8CCC-D8AA07D1F4AB",
     :habitat=>"Top of river bank, in scrub.",
     :verbatimEventDate=>"10 Jan 2004",
     :collectionCode=>"CHR",
     :gbifID=>"1091160699",
     :language=>"en",
     :verbatimLocality=>"Geraldine area, Kakahu Bush, near Hall Road",
     :occurrenceID=>"46F21423-2C66-4972-8CCC-D8AA07D1F4AB",
     :type=>"PhysicalObject",
     :catalogNumber=>"CHR 605113 A",
     :institutionCode=>"CHR",
     :identificationID=>"158031"}],
  :facets=>[]},
 {:offset=>0,
  :limit=>20,
  :endOfRecords=>true,
  :count=>0,
  :results=>[],
  :facets=>[]}]
```

MIT License

Copyright © 2022 Government of Canada

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
