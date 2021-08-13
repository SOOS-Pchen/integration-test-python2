# ARGS:
# run soos.py with the -h flag for help

# ARGS REQUIRING CUSTOMIZATION:

SOOS_CLIENT_ID = "d7dfb7ca7b58f9bf96c11e8b9c881d6eaa0a99dd5bbb9565cb0254ef12f5012f"
SOOS_API_KEY = "ODBmZmM0MTAtMzA0ZS00YmMyLThjNDgtY2ZlOTA1MDcwYjZl"

SOOS_PROJECT_NAME="wild west"


# ARGS WHERE CUSTOMIZATION IS OPTIONAL:
SOOS_MODE="run_and_wait"
SOOS_ON_FAILURE="fail_the_build"
SOOS_DIRS_TO_EXCLUDE="soos/,"
SOOS_FILES_TO_EXCLUDE=""
SOOS_ANALYSIS_RESULT_MAX_WAIT=300
SOOS_ANALYSIS_RESULT_POLLING_INTERVAL=10

# ARGS WHERE CUSTOMIZATION IS OPTIONAL, BUT UNLIKELY:
SOOS_API_BASE_URL="https://api.soos.io/api/"

# CI ENGINE SPECIFIC:
SOOS_COMMIT_HASH=""                # ENTER BUILD VERSION HERE IF KNOWN
SOOS_BRANCH_NAME=""                # ENTER BRANCH NAME HERE IF KNOWN
SOOS_BRANCH_URI=""                 # ENTER BRANCH URI HERE IF KNOWN
SOOS_BUILD_VERSION=""              # ENTER BUILD VERSION HERE IF KNOWN
SOOS_BUILD_URI=""                  # ENTER BUILD URI HERE IF KNOWN
SOOS_OPERATING_ENVIRONMENT=""      # ENTER OPERATING ENVIRONMENT HERE IF KNOWN (default will be provided)
SOOS_INTEGRATION_NAME="Script"


# **************************** Modify Above Only ***************#
mkdir -p "${WORKSPACE}/soos/workspace"
cd ${WORKSPACE}
python3 -m venv .
source bin/activate
pip3 install -r "${WORKSPACE}/soos/requirements.txt"
python3 soos/soos.py -m="${SOOS_MODE}" -of="${_ON_FAILURE}" -dte="${SOOS_DIRS_TO_EXCLUDE}" -fte="${SOOS_FILES_TO_EXCLUDE}" -wd="${SOOS_CHECKOUT_DIR}" -armw=${SOOS_ANALYSIS_RESULT_MAX_WAIT} -arpi=$SOOS_ANALYSIS_RESULT_POLLING_INTERVAL} -buri="${SOOS_API_BASE_URL}" -scp="${SOOS_CHECKOUT_DIR}" -pn="${SOOS_PROJECT_NAME}" -ch="${SOOS_COMMIT_HASH}" -bn="${SOOS_BRANCH_NAME}" -bruri="${SOOS_BRANCH_URI}" -bldver="${SOOS_BUILD_VERSION}" -blduri="${SOOS_BUILD_URI}" -oe="${SOOS_OPERATING_ENVIRONMENT}" -intn="${SOOS_INTEGRATION_NAME}"