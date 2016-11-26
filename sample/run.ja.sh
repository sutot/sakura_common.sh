# run sample scripts
for cmd in `ls -1 *.ja.sh | fgrep -v run.ja.sh`
do
  echo "-- $cmd --"
  eval "./$cmd"
  echo
done

