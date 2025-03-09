#!/bin/bash
nmcli n off ; exec "$@" & sleep 10 ; nmcli n on