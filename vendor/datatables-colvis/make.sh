#!/bin/sh

OUT_DIR=$1
DEBUG=$2

# Change into script's own dir
cd $(dirname $0)

DT_SRC=$(dirname $(dirname $(pwd)))
DT_BUILT="${DT_SRC}/built/DataTables"
. $DT_SRC/build/include.sh

# Copy CSS
rsync -r css $OUT_DIR
css_compress $OUT_DIR/css/dataTables.colVis.css

# Copy JS
rsync -r js $OUT_DIR
js_compress $OUT_DIR/js/dataTables.colVis.js

# Copy and build examples
rsync -r examples $OUT_DIR
examples_process $OUT_DIR

# Readme
cp Readme.txt $OUT_DIR

