# James Bower / @jamesbower
# Requires "aws-ip-check" from https://github.com/danfaizer/aws-ip-check
#!/bin/bash

while read domain; 
     do IP=$(dig +short $domain | grep -v "[a-z,A-Z]" | head -n 1) &&
      CHECK=$(aws-ip-check -ip $IP) &&
      FOUND=$(echo $CHECK | grep -v "not found") &&
      if [ $? -eq 0 ]; then echo $domain >> awsfound.txt && sed -e "s/$domain//" -i awsnotfound.txt; fi;
     done < temp.txt
