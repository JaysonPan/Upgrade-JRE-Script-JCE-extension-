#!/bin/bash
#for downloading JRE
#Change it if you want other format
ext="tar.gz"
jre_version=8

readonly url="http://www.oracle.com"
readonly jre_download_url1="$url/technetwork/java/javase/downloads/index.html"
readonly jre_download_url2=$(curl -s $jre_download_url1 | egrep -o "\/technetwork\/java/\javase\/downloads\/jre${jre_version}-downloads-.+?\.html" | head -1 | cut -d '"' -f 1)
[[ -z "$jre_download_url2" ]] && error "Could not get jre download url - $jre_download_url1"

readonly jre_download_url3="${url}${jre_download_url2}"
readonly jre_download_url4=$(curl -s $jre_download_url3 | egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\/[7-8]u[0-9]+\-(.*)+\/jre-[7-8]u[0-9]+(.*)linux-x64.$ext")
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -N ${jre_download_url4[0]}


#for downloading JCE
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"

