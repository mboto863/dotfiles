#!/usr/bin/env bash

# Python setup

# Install uv and set the global virtual environment
curl -LsSf https://astral.sh/uv/install.sh | sh

# =========================================================
# Spark
# =========================================================

# Spark runs on Java 17/21
# dnf does not have this version. Install the Adoptium Temurin Java Repository.
sudo dnf install adoptium-temurin-java-repository
# Enable third party repos.
sudo fedora-third-party enable
# Install jdk 17.
sudo dnf install temurin-17-jdk