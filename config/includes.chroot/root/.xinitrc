# command line parsing from http://stackoverflow.com/questions/993452/splitting-proc-cmdline-arguments-with-spaces:
set -- $(cat /proc/cmdline)
for x in "$@"; do
    case "$x" in
        wm=*)
        WM="${x#wm=}"
        ;;
    esac
done

if [ $WM ]
then
  exec $WM
else
  exec awesome
fi

