#!/bin/bash

set -eu

indir="${1}"
outdir="${2}"

cd "${outdir}"

find "${indir}" -name '*.tar.gz' -exec tar -xzf {} webapps shared \;

# tar -xzf "${indir}/*" webapps shared