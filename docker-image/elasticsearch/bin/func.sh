function waitport () {
    while ! nc -z $1 $2; do
        sleep 2
    done
}


function wait_dir_own_by_user () {
    DIRNAME=`dirname $1`
    BASENAME=`basename $1`

    USER=`ls -l ${DIRNAME} | grep -w ${BASENAME} | grep -w $2 | awk '{print $3}'`

    until [ -n "$(ls -l ${DIRNAME} | grep -w ${BASENAME} | grep -w $2 | awk '{print $3}')" ]; do
        sleep 2
    done
}


