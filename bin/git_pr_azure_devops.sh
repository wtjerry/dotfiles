#!/bin/bash

other_params=$@

work_item=$(git branch --show-current | cut -d/ -f2)

az repos pr create \
  --target-branch=main \
  --work-items $work_item \
  $other_params
