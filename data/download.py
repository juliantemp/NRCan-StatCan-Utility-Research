#!/usr/bin/env python3
"""Download utility data from Google Drive.

This script downloads data from a Google Drive folder specified by the URL variable.
It uses gdown package for this purpose.

Example
-------
    $ ./download.py


Attributes
----------
FOLDER : str
    Google Drive folder identifier, last part of the shared URL. It has to be
    specified.

URL : str
    Full Google Drive URL for the folder containing the data
"""

import gdown

FOLDER = "COMPLETE_ME"

URL = "https://drive.google.com/drive/folders/" + FOLDER


def download_folder(url):
    """Downloads an entire folder from Google Drive.

    Parameters
    ----------
    url : str
        The Google Drive url of the folder to be downloaded.
    """
    files = gdown.download_folder(url, quiet=False, use_cookies=False)
    print(f"Downloaded files: {files}")


if __name__ == "__main__":
    download_folder(URL)
