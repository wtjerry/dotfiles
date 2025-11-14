#!/bin/bash

other_params=$@

work_item=$(git branch --show-current | cut -d/ -f2)

repo_name=$(basename $(git rev-parse --show-toplevel));

az repos pr create \
  --target-branch=main \
  --work-items $work_item \
  -r $repo_name \
  $other_params
