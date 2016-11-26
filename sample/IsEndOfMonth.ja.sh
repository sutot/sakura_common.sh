#!/bin/bash
# IsEndOfMonth Sample

source ./../sakura_common.sh

# 本日が月末かどうか確認します

# 
echo 本日 : `GetDateYYYY/MM/DD`

IsEndOfMonth
end_of_month=$?

if [ $end_of_month -eq 1 ]; then
  echo "月末です"
else
  echo "月末ではありません"
fi
