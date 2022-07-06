# apertiiif-batch-rijks-test [![sync s3](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml/badge.svg)](https://github.com/nyu-dss/serverless-iiif-rijks-test/actions/workflows/sync-s3.yml)  
Test repo to deploy to S3 + trigger IIIF Image API Lambda 


[![japanese 3 panel print circa 1770](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/iiif/2/rijks-test_kasukawa_004/full/,300/0/default.jpg)](https://dss.hosting.nyu.edu/viewpoint/mirador/#manifests[]=https%3A%2F%2Fnyu-dss-serverless-iiif-presentation-test.s3.us-east-1.amazonaws.com%2Frijks-test_kasukawa-004%2Fmanifest.json&theme=dark&thumbs=off&view=single&workspacecontrols=false)
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

## Narrative Workflow (WiP)

**Setup**  
1. Admin creates repo for new collection using `apertiiif-batch-template` named `apertiiif-batch-collectionname` where `collectionname` will be the namespace used for resources generated.
2. Admin adds S3 secrets to the repo enviroment.
3. Admin gives curator(s) write access to the repo. They can add images and metadata but cannot access settings or secrets.  

**Ingest (GitHub)**  
1. Curator adds images to `src` directory (multipart object structure TBD) and metadata to (TBD).
2. When committed to the `main` branch, a GitHub Action will convert images to tif, namespace them by prepending the collection name and any subfolder names, and sync them to the S3 source image bucket. (DONE)
3. Another Action will use [O'Sullivan gem](https://github.com/iiif-prezi/osullivan) to generate Presentation API JSON resources (e.g., manifests, canvases, etc.) and sync them to the S3 presentation bucket. (TBD) It will also create a listing of resources published and deploy it to GitHub pages. (TBD)

**Publish (AWS)**
1. The Presentation API resources that have been synced are done and ready. There is no additional work for AWS to do. (TBD)
2. The images synced to the S3 source image bucket are now accessible by the serverless-iiif lambda policy. Requests that hit the IIIF Image API lambdas (via Cloudfront) trigger derivative builds to an S3 cache bucket. (DONE)

## Log

- [x] Deploy [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) to NYU DSS AWS account via SAM CLI
- [x] Configure S3 bucket to hold 'source' images
- [x] Finish this repo with [sample images](https://github.com/nyu-dss/apertiiif-batch-rijks-test/tree/main/src/kasukawa) and a [GitHub Action](https://github.com/nyu-dss/apertiiif-batch-rijks-test/actions/workflows/sync-s3.yml) that converts those images to tif, namespaces them, and syncs them to the S3 source bucket.
- [ ] Work on IIIF Presentation API implmentation
- [ ] Automate an updated listing of resources published and deploy as GH Pages site
- [ ] Create `apertiiif-batch-template` repo for each collection to copy
- [ ] Document namespacing, potential collection onboarding policy 
- [ ] Get feedback
