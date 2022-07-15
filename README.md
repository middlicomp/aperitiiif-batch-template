# apertiiif-batch-template 
[![lint batch](https://github.com/nyu-dss/apertiiif-batch-template/actions/workflows/lint-batch.yml/badge.svg)](https://github.com/nyu-dss/apertiiif-batch-template/actions/workflows/lint-batch.yml) [![publish batch](https://github.com/nyu-dss/apertiiif-batch-rijks-test/actions/workflows/publish-batch.yml/badge.svg)](https://github.com/nyu-dss/apertiiif-batch-rijks-test/actions/workflows/publish-batch.yml)

reusable template repository to store and publish an apertiiif batch to aws s3 & nyu-dss [serverless-iiif](https://github.com/samvera-labs/serverless-iiif)

[![japanese 3 panel print circa 1770](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/latest/iiif/2/rijks-test_kasukawa-004/full/500,/0/default.jpg)](https://dss.hosting.nyu.edu/viewpoint/mirador/#manifests[]=https%3A%2F%2Fnyu-dss-serverless-iiif-presentation-test.s3.us-east-1.amazonaws.com%2Frijks-test_kasukawa-004%2Fmanifest.json&theme=dark&thumbs=off&view=single&workspacecontrols=false)
> Triptych by Katsukawa Shunshō courtesy of the [Rijksmuseum via WikiMedia Commons](https://commons.wikimedia.org/wiki/File:Acteurstriptiek-Rijksmuseum_RP-P-2008-246.jpeg).  
> Served here via nyu-dss [serverless-iiif](https://twt4gwyokx4jxgo2tcptgtn4v40qajbb.lambda-url.us-east-1.on.aws/latest/iiif/2/rijks-test_kasukawa-004/full/500,/0/default.jpg).

## Architecture  (WiP)

1. Canonical Metadata and Image Data  
a. GitHub Repo

2. IIIF Image API  
a. [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) implementation    
b. Source image S3 bucket  
c. GitHub Action uses [apertiiif gem](https://github.com/nyu-dss/apertiiif) to process images, syncs them to S3 source bucket

3. IIIF Presentation API  
a. S3 bucket for published json  
b. GitHub Action uses [apertiiif gem](https://github.com/nyu-dss/apertiiif) to generate IIIF Presentation API resources, syncs them to S3 presentation bucket

4. Discovery
a. Github Action uses [apertiiif gem](https://github.com/nyu-dss/apertiiif) to generate 2 indices of resources produced (`index.html` for humans, `index.json` for machines), publishes them to Github Pages

## Log

- [x] Deploy [serverless-iiif](https://github.com/samvera-labs/serverless-iiif) to NYU DSS AWS account via SAM CLI
- [x] Configure S3 bucket to hold 'source' images
- [x] Create template repo with [sample images](https://github.com/nyu-dss/apertiiif-batch-rijks-test/tree/main/src/kasukawa) and workflows.
- [ ] Create [apertiiif gem](https://github.com/nyu-dss/apertiiif)
  + [x] implement thor cli
  + [x] use rubocop
  + [x] process multi-asset items
  + [x] use parallel gem for multi-thread processing
  + [x] process item-level metadata
  + [x] generate IIIF presentation manifest.json files
  + [ ] generate IIIF presentation collection.json file
  + [x] generate index.html listing
  + [x] generate index.json listing
  + [ ] write tests!!
  + [ ] write command to lint batch, flag issues
- [ ] Document workflows, potential collection onboarding policy
- [ ] Get feedback

## Narrative Workflow (WiP)

**Setup** (GitHub)
1. Admin creates repo for new collection using `apertiiif-batch-template` named `apertiiif-batch-collectionname` where `collectionname` will be the namespace used for resources generated.
2. Admin adds S3 secrets to the repo enviroment.
3. Admin enables Actions and GitHub pages on the repo.
4. Admin gives curator(s) write access to the repo. They can add images and metadata but cannot access settings or secrets.  

**Ingest (GitHub)**  
1. Curator adds images to `src/data` directory (multipart object structure TBD) and metadata via CSV file to `src/metadata`.
2. Curator adds metadata defaults as needed to the `config.yml` file
3. When committed to the `main` branch, a GitHub Action will convert images to tif, namespace them by prepending the collection name and any subfolder names, and sync them to the S3 source image bucket.
4. It will also use the [O'Sullivan gem](https://github.com/iiif-prezi/osullivan) to generate Presentation API JSON resources (e.g., manifests, canvases, etc.) and sync them to the S3 presentation bucket.
5. Lastly, it will also create listings of resources published (html and json) and deploy them to GitHub pages.

**Publish (AWS)**
1. The Presentation API resources that have been synced are done and ready. There is no additional work for AWS to do.
2. The images synced to the S3 source image bucket are now accessible by the serverless-iiif lambda policy. Requests that hit the IIIF Image API lambdas (via Cloudfront) trigger derivative builds to an S3 cache bucket.
