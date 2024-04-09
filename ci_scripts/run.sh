#!/usr/bin/env bash

echo "Creating docs directory"
mkdir -p docs
mkdir -p docs/mockups
mkdir -p docs/shapes

echo "Copying static files"
cp csdm_model/static/vocab-management.html docs/vocab-management.html
cp csdm_model/static/vocab-attributions.html docs/vocab-attributions.html
cp csdm_model/static/vocab-impspecs.html docs/vocab-impspecs.html
cp csdm_model/*.ttl docs/
cp csdm_model/shapes/*.ttl docs/shapes

echo "Running asciidoctor"
asciidoctor -o docs/index.html csdm_model/static/index.adoc
asciidoctor -o docs/mockups/profiles.html mockups/profiles/index.adoc

echo "Running pyLODE on components"
pylode -p vocpub -i csdm_model/attributions.ttl -o docs/vocab-attributions.html
pylode -i csdm_model/commonpatterns.ttl -o docs/commonpatterns.html
pylode -i csdm_model/container.ttl -o docs/container.html
pylode -i csdm_model/geometryprim.ttl -o docs/geometryprim.html
pylode -p vocpub csdm_model/impspecs.ttl -o docs/vocab-impspecs.html
pylode -i csdm_model/parcels.ttl -o docs/parcels.html
pylode -i csdm_model/surveyfeats.ttl -o docs/surveyfeats.html
pylode -i csdm_model/surveyobs.ttl -o docs/surveyobs.html
pylode -i csdm_model/surveyprov.ttl -o docs/surveyprov.html
