#!/bin/bash

# Initialize basic vars and helpers
source blueprint-lib/init.sh

##
# Add dependencies here
##

# source blueprint-lib/docker.sh

##
# ADD BLUEPRINT CODE BELOW HERE
#
# BASE_PATH is the full path to the project root
# APP_NAME is the name of the Django app that will be modified
##

BLUEPRINT="EmailAuth"
NAME="EmailAuth"

DATA_1="{ name: '${BLUEPRINT}', human_name: '${NAME}', access_route: '${BLUEPRINT}'},"
DATA_2="import { ${BLUEPRINT}Navigator } from '..\/features\/${BLUEPRINT}\/navigator';"
DATA_3="${BLUEPRINT}: { screen: ${BLUEPRINT}Navigator },"
DATA_4="import { ${NAME}Reducer } from '..\/features\/${NAME}\/redux\/reducers';"
DATA_5="${NAME}: ${NAME}Reducer,"
DATA_6="import { ${NAME}Saga } from '..\/features\/${NAME}\/redux\/sagas';"
DATA_7="${NAME}Saga,"

echo ">> remove blueprint folder"
if [ -d "$BASE_PATH/src/features/$BLUEPRINT" ]; then rm -Rf $BASE_PATH/src/features/$BLUEPRINT; fi

echo ">> remove 1" 
sed -i "/${DATA_1}/d" $BASE_PATH/src/config/installed_blueprints.js

echo ">> remove 2"
sed -i "/${DATA_2}/d" $BASE_PATH/src/navigator/mainNavigator.js

echo ">> remove 3"
sed -i "/${DATA_3}/d" $BASE_PATH/src/navigator/mainNavigator.js

echo ">> remove 4"
sed -i "/${DATA_4}/d" $BASE_PATH/src/redux/mainReducer.js

echo ">> remove 5"
sed -i "/${DATA_5}/d" $BASE_PATH/src/redux/mainReducer.js

echo ">> remove 6"
sed -i "/${DATA_6}/d" $BASE_PATH/src/redux/mainSaga.js

echo ">> remove 7"
sed -i "/${DATA_7}/d" $BASE_PATH/src/redux/mainSaga.js