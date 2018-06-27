#!/bin/bash
function dockeROS() {
  local workspace=$(roscd && cd .. && pwd)
  local package=$(rospack find dockeros)
  case $1 in
  b|build)
    shift
    python2 $package/src/remote_access.py build $@
    ;;
  l|launch)
    shift
    python2 $package/src/remote_access.py build $@
    ;;
  *)
    python2 $package/src/remote_access.py
    ;;
  esac
}

function complete_dockeROS() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local cmd="${COMP_WORDS[1]}"

  case "${COMP_CWORD}" in
	1)
    COMPREPLY=( $(compgen -W "b build l launch" -- $cur) )
    ;;
	2)
    case "${cmd}" in
    b|build)
      shift
      echo "to be implemented"
      ;;
    l|launch)
      shift
      echo "to be implemented"
      ;;
    esac
    ;;
	*)
    COMPREPLY=""
    ;;
  esac
}

complete -F complete_dockeROS dockeROS
