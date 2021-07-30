#Instead of copy-pasting AWS creds each time after running gimme-aws-creds, 
#this script automatically fetches AWS creds from default location and run the docker image

#!/bin/bash
counter=0
while read p; do
  tmp=${p#*= }
  ((counter++))

  if [[ $counter == 2 ]]
  then
   export AWS_ID=$tmp
  elif [[ $counter == 3 ]]
  then
   export AWS_KEY=$tmp
  elif [[ $counter == 4 ]]
  then
   export AWS_TOKEN=$tmp
  fi
done < /Users/{userId}/.aws/credentials 
docker run -e AWS_ACCESS_KEY_ID=$AWS_ID -e AWS_SECRET_ACCESS_KEY=$AWS_KEY -e AWS_SESSION_TOKEN=$AWS_TOKEN -t -p 8080:4098 {imageName}
