#!/bin/bash

# This script copies the appropriate GoogleService-Info.plist file based on the build configuration

# Get the configuration from the build settings
CONFIGURATION="${CONFIGURATION}"

# Define the source path based on the configuration
if [ "${CONFIGURATION}" == "Debug-dev" ] || [ "${CONFIGURATION}" == "Release-dev" ]; then
    GOOGLE_SERVICE_INFO_PLIST="${PROJECT_DIR}/Runner/Firebase/dev/GoogleService-Info.plist"
elif [ "${CONFIGURATION}" == "Debug-prod" ] || [ "${CONFIGURATION}" == "Release-prod" ]; then
    GOOGLE_SERVICE_INFO_PLIST="${PROJECT_DIR}/Runner/Firebase/prod/GoogleService-Info.plist"
else
    echo "Warning: Unknown configuration ${CONFIGURATION}. Using dev configuration."
    GOOGLE_SERVICE_INFO_PLIST="${PROJECT_DIR}/Runner/Firebase/dev/GoogleService-Info.plist"
fi

# Check if the source file exists
if [ ! -f "${GOOGLE_SERVICE_INFO_PLIST}" ]; then
    echo "Error: GoogleService-Info.plist not found at ${GOOGLE_SERVICE_INFO_PLIST}"
    echo "Please ensure you have placed the Firebase configuration files in the correct directories:"
    echo "  - ios/Runner/Firebase/dev/GoogleService-Info.plist (for dev environment)"
    echo "  - ios/Runner/Firebase/prod/GoogleService-Info.plist (for production environment)"
    exit 1
fi

# Copy the file to the Runner directory
cp "${GOOGLE_SERVICE_INFO_PLIST}" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"
echo "Copied ${GOOGLE_SERVICE_INFO_PLIST} to Runner directory"