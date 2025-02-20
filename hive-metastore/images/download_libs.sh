#!/bin/bash

# Create libs directory if it doesn't exist
mkdir -p libs

# List of files and their corresponding Maven paths
files=(
  "bundle-2.30.7.jar|org/osgi/org.osgi.core/2.30.7/org.osgi.core-2.30.7.jar"
  "hadoop-aws-3.4.1.jar|org/apache/hadoop/hadoop-aws/3.4.1/hadoop-aws-3.4.1.jar"
  "hadoop-client-api-3.4.1.jar|org/apache/hadoop/hadoop-client-api/3.4.1/hadoop-client-api-3.4.1.jar"
  "hadoop-client-runtime-3.4.1.jar|org/apache/hadoop/hadoop-client-runtime/3.4.1/hadoop-client-runtime-3.4.1.jar"
  "hadoop-hdfs-3.4.1.jar|org/apache/hadoop/hadoop-hdfs/3.4.1/hadoop-hdfs-3.4.1.jar"
  "postgresql-42.7.4.jar|org/postgresql/postgresql/42.7.4/postgresql-42.7.4.jar"
)

# Base URL for Maven Central Repository
base_url="https://repo1.maven.org/maven2"

# Download files if they don't already exist
for item in "${files[@]}"; do
  IFS='|' read -r file maven_path <<< "$item"
  file_path="libs/$file"
  url="$base_url/$maven_path"
  
  if [ -f "$file_path" ]; then
    echo "$file already exists. Skipping download."
  else
    echo "Downloading $file from $url..."
    wget -O "$file_path" "$url"
    
    if [ $? -eq 0 ]; then
      echo "$file downloaded successfully."
    else
      echo "Failed to download $file."
    fi
  fi
done

echo "All tasks completed."