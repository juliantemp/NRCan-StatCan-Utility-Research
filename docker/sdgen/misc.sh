#!/bin/bash
echo "Installing miscelanous libraries"

pip install tensorflow-privacy
pip install diffprivlib
pip install sktime[all_extras]
pip install openpyxl

echo "Done!!!"
