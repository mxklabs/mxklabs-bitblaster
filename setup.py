# -*- coding: utf-8 -*-

from __future__ import print_function

import sys

try:
    from skbuild import setup
except ImportError:
    print(
        "Please update pip, you need pip 10 or greater,\n"
        " or you need to install the PEP 518 requirements in pyproject.toml yourself",
        file=sys.stderr,
    )
    raise

setup(
    name="bitblaster",
    version="0.0.6",
    description="A library for expressing and solving things in propositional logic.",
    author="Mark Kattenbelt",
    author_email="mark@mxklabs.co.uk",
    url="https://github.com/mxklabs/mxklabs-bitblaster",
    license="MIT",
    packages=["bitblaster"],
    package_dir={"": "src"},
    cmake_install_dir="src/bitblaster",
    python_requires='>=3.6'
)
