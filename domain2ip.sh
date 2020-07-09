#!/bin/bash
echo $(xargs -a hosts.txt dig +short | sort -u) > ips.txt
