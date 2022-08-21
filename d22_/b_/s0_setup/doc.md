
# sphinx

- https://gdevops.gitlab.io/tuto_sphinx_material/
- https://github.com/microsoft/recommenders
- https://shunsvineyard.info/2019/09/19/use-sphinx-for-python-documentation/
- https://www.jetbrains.com/pycharm/guide/tutorials/sphinx_sites/setup/
- https://pyformlang.readthedocs.io/
- https://blog.shichao.io/2013/03/19/create_a_personal_website_with_sphinx.html
[\]
- http://www.numericalexpert.com/blog/sphinx2website/
- 
- [How to use Sphinx to build your website](https://jjleijen.home.xs4all.nl/pws/computer/sphinx/index.html)
- [sphinx-tutorial](https://github.com/ericholscher/sphinx-tutorial/)


```commandline
conda install sphinx
sphinx-quickstart
```





# quickstart

```commandline
cd doc
sphinx-quickstart
```

```
project="Schlockchain"
copyright = "2021, Paul Everitt <pauleveritt@me.com>"
author = "Paul Everitt <pauleveritt@me.com>"
extensions = [
    "myst_parser",
]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store", ".venv"]
html_static_path = ["_static"]
templates_path = ["_templates"]
```

# apidoc

```commandline
sphinx-apidoc -f -o doc/source ./d
```

index.rst

```

Welcome to dsm's documentation!
===============================

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   modules

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`


```

# autogen

- https://www.sphinx-doc.org/en/master/man/sphinx-autogen.html

# livereload



```
#run_live.sh in the ame directory as conf.py
from livereload import Server, shell

if __name__ == '__main__':
    server = Server()
    server.watch('*.rst', shell('make html'), delay=1)
    server.watch('*.md', shell('make html'), delay=1)
    server.watch('*.py', shell('make html'), delay=1)
    server.watch('_static/*', shell('make html'), delay=1)
    server.watch('_templates/*', shell('make html'), delay=1)
    server.serve(root='_build/html')
```

# Markdown

```commandline
conda install -c conda-forge myst-parser
```


# numpy style documentation

```
extensions = [
...
sphinx.exe.napoleon
...
]
napoleon_google_docstring = False
napoleon_use_param = False
napoleon_use_ivar = True
```

# Plugins

- autodoc
- intersphinx
- viewcode
- 

# Misc

[stackoverflow](https://stackoverflow.com/questions/59903051/sphinxs-autodocs-automodule-having-apparently-no-effect)

I'll try answering by putting the "canonical" approach side-by-side with your case.
The usual "getting started approach" follows these steps:

3. create a doc directory in your project directory (it's from this directory the commands in the following steps are executed).
4. sphinx-quickstart (choosing separate source from build).
5. sphinx-apidoc -o ./source ..
6. make html

This would yield the following structure:
```
C:\Project
|
|   agent.py
|   
|---docs
|   |   make.bat
|   |   Makefile
|   |   
|   |---build
|   |               
|   |---source
|       |   conf.py
|       |   agent.rst
|       |   index.rst
|       |   modules.rst

```

In your conf.py you'd add (after step 2):

```
sys.path.insert(0, os.path.abspath(os.path.join('..', '..')))
```

and in index.rst you'd link modules.rst:

```

Welcome to Projects documentation!
================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   modules


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

```

Now compare the above with what you have - from what you shared in your question:

```


C:\Project
|
|   agent.py
|   
|---apidoc
|   |   agent.rst
|   |   conf.py
|   |
|   |-- _build
You ran: sphinx-build -b html apidoc apidoc/_build
```

and in your conf.py:

sys.path.insert(0, os.path.abspath('.'))
Your error stacktrace says it couldn't find the module agent. That's probably because you didn't go 1 level down in your conf.py (it's pointing to the path with .rst, not the path with .py), this should work: sys.path.insert(0, os.path.abspath('..')). Also, if you didn't manually edit/connect your modules.rst in your index.rst you are likely to only see that module.
You may care to notice the signatures of the sphinx commands at play:

```

sphinx-apidoc [OPTIONS] -o <OUTPUT_PATH> <MODULE_PATH>
sphinx-build [options] <sourcedir> <outputdir> [filenames …]
<sourcedir> refers to where .rst are, and 
<MODULE_PATH> to where .py are. 
<OUTPUT_PATH> to where .rst are placed, and 
<outputdir> to where .html are placed.

```

Please also notice, you mentioned: "the project's directory as the current working directory." I've seen "working directory" mentioned in sphinx threads on stackoverflow, interchangeably as both the Project base directory, or the docs directory. However, if you search the Sphinx documentation for "working directory" you'll find no mention of it.

Finally, there is an advantage to using the file/directory structure of the "getting started approach". It basically "puts you on the same page" with most threads on the Sphinx tag, and that way alleviates the mental work of mapping the cases to different directory/file structures.

I hope this helps.


# Misc1

```
#!/bin/bash
#
# To execute this script, use "sage -sh"
#
#
# To upload updated apidoc to leopardi@SourceForge (2017), use:
# rsync -avz --delete doc/_build/html/ leopardi@web.sourceforge.net:/home/project-web/boolean-cayley-graphs/htdocs/
#
source ./bcg_version.sh

# Delete existing doc/*.rst files
rm -f doc/boolean_cayley_graphs*.rst

# Create doc/references.rst from boolean_cayley_graphs/references.py
sage<<EOF
from boolean_cayley_graphs.references import print_sage_references_index_rst
ref_file = open("doc/references.rst","w")
print_sage_references_index_rst(file=ref_file)
quit
EOF
pushd doc

# Use sphinx-apidoc to re-create the documentation from the Python files in ../boolean_cayley_graphs
sphinx-apidoc -e -E \
    -H "Boolean-Cayley-graphs" \
    -A "Paul Leopardi" \
    -V ${BCG_VERSION} \
    -R ${BCG_RELEASE} \
    -o . ../boolean_cayley_graphs
make html
popd
```

# Themes

- sphinx_rtd_themes
- albratos

# sphinx-autobuild
# sphinx-autodoc
# sphinx-intersphinx


```
The sphinx command has global options such as --version, --verbose
sphinx quickstart invoke sphinx-quickstart feature.
sphinx build html invoke sphinx-build -M html feature
such sphinx autodoc invoke sphinx-apidoc and/or sphinx-autogen feature
```

# Personal Webpage

## Local table of contents
It’s not possible to use the ‘toctree’ directive to insert a local table of contents on a page. An example of a local table of contents can be seen in the sidebar of your Sphinx site. The table of contents in the sidebar is generated on template level. See the ‘toc’ template variable (http://sphinx.pocoo.org/templating.html?highlight=template#toc)

The ‘toc’ variable is used in the basic theme layout.html template file (/usr/local/lib/python2.6/site-packages/Sphinx-0.6.5-py2.6.egg/sphinx/themes/basic/layout.html).

The ‘toc’ variable is expanded by the get_toc_context function in html.py (/usr/local/lib/python2.6/site-packages/Sphinx-0.6.5-py2.6.egg/sphinx/builders/html.py).

Idea/wish: toc directive.


# Anaconda Environment


```commandline
conda install sphinx-book-theme
pip install pansi
conda install -c conda-forge sphinx
```
 