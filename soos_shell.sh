# run soos.py with the -h flag for help
# REQUIRED ARGS:
SOOS_PROJECT_NAME="peijin_loves_python"
SOOS_REPO="https://api.github.com/repos/soos-io/soos-ci-analysis-python/releases/"
TAG="latest" #or TAG="latest" if you want the latest release

# BUILD/BRANCH SPECIFIC ARGS:
SOOS_COMMIT_HASH=""                # ENTER COMMIT HASH HERE IF KNOWN
SOOS_BRANCH_NAME=""                # ENTER BRANCH NAME HERE IF KNOWN
SOOS_BRANCH_URI=""                 # ENTER BRANCH URI HERE IF KNOWN
SOOS_BUILD_VERSION=""              # ENTER BUILD VERSION HERE IF KNOWN
SOOS_BUILD_URI=""                  # ENTER BUILD URI HERE IF KNOWN
SOOS_OPERATING_ENVIRONMENT=""      # ENTER OPERATING ENVIRONMENT HERE IF KNOWN (default will be provided)
SOOS_INTEGRATION_NAME="Script"

# OPTIONAL ARGS:
WORKSPACE="C:\Users\pchen\Testing\integration-test-python2"
SOOS_MODE="run_and_wait"
SOOS_ON_FAILURE="fail_the_build"
SOOS_DIRS_TO_EXCLUDE="soos, IgnoreMe"
SOOS_FILES_TO_EXCLUDE=""
SOOS_ANALYSIS_RESULT_MAX_WAIT=300
SOOS_ANALYSIS_RESULT_POLLING_INTERVAL=10
SOOS_CHECKOUT_DIR="./"

SOOS_API_BASE_URL="https://dev-api.soos.io/api/"



# **************************** Modify Above Only ***************#
mkdir -p "${WORKSPACE}/soos/workspace"

cd "${WORKSPACE}/soos/workspace"
echo $SOOS_REPO$TAG
curl -s "$SOOS_REPO$TAG" | grep "browser_download_url" | cut -d '"' -f 4 | xargs -n 1 curl -LO
sha256sum -c soos.sha256
sha256sum -c requirements.sha256

cd "${WORKSPACE}/soos"

python -m venv ./

cd Scripts
source activate
cd ${WORKSPACE}

pip3 install -r soos/workspace/requirements.txt
python soos/workspace/soos.py -m="${SOOS_MODE}" -of="${SOOS_ON_FAILURE}" -dte="${SOOS_DIRS_TO_EXCLUDE}" -fte="${SOOS_FILES_TO_EXCLUDE}" -wd="${SOOS_CHECKOUT_DIR}" -armw=${SOOS_ANALYSIS_RESULT_MAX_WAIT} -arpi=${SOOS_ANALYSIS_RESULT_POLLING_INTERVAL} -buri="${SOOS_API_BASE_URL}" -scp="${SOOS_CHECKOUT_DIR}" -pn="${SOOS_PROJECT_NAME}" -ch="${SOOS_COMMIT_HASH}" -bn="${SOOS_BRANCH_NAME}" -bruri="${SOOS_BRANCH_URI}" -bldver="${SOOS_BUILD_VERSION}" -blduri="${SOOS_BUILD_URI}" -oe="${SOOS_OPERATING_ENVIRONMENT}" -intn="${SOOS_INTEGRATION_NAME}"
