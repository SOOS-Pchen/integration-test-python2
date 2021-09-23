
:: run soos.py with the -h flag for help
:: ARGS REQUIRING CUSTOMIZATION:
set "SOOS_PROJECT_NAME=peijin_branching_out"

:: ARGS WHERE CUSTOMIZATION IS OPTIONAL:
set "SOOS_MODE=run_and_wait"
set "SOOS_ON_FAILURE=fail_the_build"
set "SOOS_DIRS_TO_EXCLUDE=soos,IgnoreMe"
set "SOOS_FILES_TO_EXCLUDE="
set "SOOS_ANALYSIS_RESULT_MAX_WAIT=300"
set "SOOS_ANALYSIS_RESULT_POLLING_INTERVAL=10"
set "SOOS_CHECKOUT_DIR=../"

:: ARGS WHERE CUSTOMIZATION IS OPTIONAL, BUT UNLIKELY:
set "SOOS_API_BASE_URL=https://dev-api.soos.io/api/"
set "ROOT=%CD%/soos" 
set "WORKSPACE=%ROOT%/workspace" 
::#mkdir "%WORKSPACE%"
cd %CD%
python -m venv .

cd %WORKSPACE%
pip3 install -r requirements.txt

python soos.py -m="%SOOS_MODE%" -of="%SOOS_ON_FAILURE%" -dte="%SOOS_DIRS_TO_EXCLUDE%" -fte="%SOOS_FILES_TO_EXCLUDE%" -wd="%SOOS_CHECKOUT_DIR%" -armw=%SOOS_ANALYSIS_RESULT_MAX_WAIT% -arpi=%SOOS_ANALYSIS_RESULT_POLLING_INTERVAL% -buri="%SOOS_API_BASE_URL%" -scp="%SOOS_CHECKOUT_DIR%" -pn="%SOOS_PROJECT_NAME%" -ch="%SOOS_COMMIT_HASH%" -bn="%SOOS_BRANCH_NAME%" -bruri="%SOOS_BRANCH_URI%" -bldver="%SOOS_BUILD_VERSION%" -blduri="%SOOS_BUILD_URI%" -oe="%SOOS_OPERATING_ENVIRONMENT%" -intn="%SOOS_INTEGRATION_NAME%"

