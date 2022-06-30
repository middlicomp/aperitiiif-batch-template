# serverless-iiif-rijks-test [![sync s3](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml/badge.svg)](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml)  
Test repo to deploy to S3 + trigger IIIF Image API Lambda 

![japanese 3 panel print circa 1770](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2/rijks-test_kasukawa_004/full/,300/0/default.jpg)
> Triptych by Katsukawa Shunshō courtesy of the [Rijksmuseum via WikiMedia Commons](https://commons.wikimedia.org/wiki/File:Acteurstriptiek-Rijksmuseum_RP-P-2008-246.jpeg).  
> Served here via [serverless-iiif endpoint](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2/rijks-test_kasukawa_004/full/,300/0/default.jpg). 

## Achitecture (WiP)

1. Cannonical Metadata and Image Data  
a. GitHub Repo

2. IIIF Image API  
a. [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) implementation  
b. Source image S3 bucket  
c. GitHub Action to sync images to S3 source bucket 

3. IIIF Presentation API  
a. S3 bucket for published json  
b. GitHub Action to generate IIIF Presentation API resources and sync to S3 presentation bucket

4. Tests and Monitoring  
a. Github Action to deploy an automated listing of resources published using GitHub pages  
b. Cron to randomly select a set of published resources and crawl to validate image delivery

## Workflow (WiP)

*Narrative lorem ipsum*

## Log

- [x] Deploy [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) to NYU DSS AWS account via SAM CLI
- [x] Configure S3 bucket to hold 'source' images
- [x] Finish this repo with [sample images](https://github.com/nyu-dss/serverless-iiif-rijks-test/tree/main/src/kasukawa) and a [github action](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml) that converts those images to tif, namespaces them, and syncs them to the S3 source bucket.
- [ ] Work on IIIF Presentation API implmentation
- [ ] Automate an updated listing of resources published and deploy as GH Pages site
- [ ] Create `serverless-iiif-template` repo for each collection to copy
- [ ] Document namespacing, potential collection onboarding policy 
- [ ] Get feedback
