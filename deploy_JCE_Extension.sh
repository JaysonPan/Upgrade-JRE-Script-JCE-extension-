#!/bin/bash
tar zxf jre*.tar.gz -C . 
rm -rf jre*.tar.gz
unzip -qq jce_policy-8.zip
mv UnlimitedJCEPolicyJDK8/*.jar "jre"*"/lib/security/"
rm -rf jce_policy-8.zip UnlimitedJCEPolicyJDK8
#java.security update
sed -i 's/dev\/random/dev\/.\/urandom/'g jre*/lib/security/java.security
