from setuptools import setup, find_packages,Extension
import pybind11
import os
project_root = os.path.abspath(os.path.dirname(__file__))
lib = os.path.join(project_root, 'RK-VK', 'lib')
ext_module = Extension(
    "crncyk",
    sources=["crncyk.cc"],
    include_dirs=[pybind11.get_include(),"rki","RK-VK"],
    library_dirs=[lib],
    language="c++",
    extra_compile_args=["/std:c++23", "/O2","/utf-8"],
)
setup(
    name="rncyk",
    version="0.1",
    packages=find_packages(),
    author="enstarep",
    author_email="enstarep@rncyk.org",
    license="BSD3",
    ext_modules=[ext_module],
    package_data={"rncyk": ["*.spv","loader.dll"]},
    install_requires=["numpy>=1.2.4","scipy>=1.8.0"],
    python_requires='>=3.12',
)