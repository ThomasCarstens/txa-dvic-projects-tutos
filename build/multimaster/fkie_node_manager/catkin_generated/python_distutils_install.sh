#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/thomas/cours-de-robotique/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/thomas/cours-de-robotique/install/lib/python2.7/dist-packages:/home/thomas/cours-de-robotique/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/thomas/cours-de-robotique/build" \
    "/usr/bin/python2" \
    "/home/thomas/cours-de-robotique/src/multimaster/fkie_node_manager/setup.py" \
    build --build-base "/home/thomas/cours-de-robotique/build/multimaster/fkie_node_manager" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/thomas/cours-de-robotique/install" --install-scripts="/home/thomas/cours-de-robotique/install/bin"
