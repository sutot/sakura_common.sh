# run sample scripts
for cmd in `ls -1 *.sh | grep -v ja | fgrep -v run.sh`
do
  echo "-- $cmd --"
  eval "./$cmd"
  echo
done

