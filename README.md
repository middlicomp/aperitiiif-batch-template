# serverless-iiif-rijks-test [![sync s3](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml/badge.svg)](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml)  
Test repo to deploy to S3 + trigger IIIF Image API Lambda 

![japanese 3 panel print circa 1770](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2/rijks-test_kasukawa_004/full/,300/0/default.jpg)
> Triptych by Katsukawa Shunshō courtesy of the [Rijksmuseum via WikiMedia Commons](https://commons.wikimedia.org/wiki/File:Acteurstriptiek-Rijksmuseum_RP-P-2008-246.jpeg).  
> Served here via [serverless-iiif endpoint](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2/rijks-test_kasukawa_004/full/,300/0/default.jpg). 

## Objective

*lorem ipsum...*

## Done
- [x] Deployed [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) to NYU DSS AWS account via SAM CLI
- [x] Configured S3 bucket to hold 'source' images
- [x] Finished this repo, which contains [sample images](https://github.com/nyu-dss/serverless-iiif-rijks-test/tree/main/src/kasukawa) and a [github action](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml) that converts those images to tif, namespaces them, and syncs them to the S3 source bucket.

## To Do
- [ ] Automate an updates listing of resources publishedm deploy as GH Pages site
- [ ] Document namespacing, potential policy
- [ ] Work on IIIF Presentation API implmentation
- [ ] Get feedback
