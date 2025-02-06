#!/bin/bash

inotifywait -m -e create -e move -r --format "%f" ${MONITOR_DIR} \
| while read FILENAME; do

 if [ ! -f /tmp/photoprism_index_scheduled ]; then
    touch /tmp/photoprism_index_scheduled
    
    # Schedule a job to run after DELAY seconds
    ( 
      sleep "${INDEXING_INTERVAL:-60}"
      docker exec photoprism photoprism index --cleanup
      rm /tmp/photoprism_index_scheduled
    ) &
  fi

done