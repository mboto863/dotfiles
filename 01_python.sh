#!/usr/bin/env bash

# Python setup

# Install uv and set the global virtual environment
curl -LsSf https://astral.sh/uv/install.sh | sh
uv venv

# =========================================================
# Spark
# =========================================================
sudo dnf install -y java-latest-openjdk
uv pip install pyspark
