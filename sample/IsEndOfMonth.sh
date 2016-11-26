#!/bin/bash
# IsEndOfMonth Sample

source ./../sakura_common.sh

# Check end of the month.

# display now date
echo Today : `GetDateYYYY/MM/DD`

IsEndOfMonth
end_of_month=$?

if [ $end_of_month -eq 1 ]; then
  echo "Today is end of month."
else
  echo "Today is not end of month."
fi
