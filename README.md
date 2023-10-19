# Bookmark Collector

Bookmark Collector is a Bash script that allows you to collect and store bookmarks from popular web browsers, including Chrome, Firefox, and Brave. This project is developed and tested using Windows Subsystem for Linux (WSL) on Windows, making it compatible with both Windows and Linux environments.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Customizing Browser Bookmark Paths](#customizing-browser-bookmark-paths)
- [Contributing](#contributing)
- [License](#license)

## Features

- Collect bookmarks from Chrome, Firefox, and Brave browsers.
- Store bookmarks in a single text file for easy access and organization.
- Retrieve and consolidate bookmarks from different browsers into one location.

## Prerequisites

Before using Bookmark Collector, ensure that you have the following prerequisites:

- The web browsers from which you want to collect bookmarks should be installed on your system.
- The script depends on the following tools:
  - [jq](https://stedolan.github.io/jq/): A lightweight and flexible command-line JSON processor.
  - [sqlite3](https://www.sqlite.org/index.html): A command-line interface for SQLite, which is used for retrieving Firefox bookmarks.
  
Make sure you have these tools installed before using the script.

## Installation

Follow these steps to install Bookmark Collector on your system:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/Harshyadav00/BookMark_Collector.git
