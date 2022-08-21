
# Changelog

## Conf



## Index


## Hierarchical Content

- index.md
- _pages
  - about directory
    - index.md
    - about_me.md
      ```
      About
      {toctree}
      about_me
      about_sphinx
      ```



## Tutorial

- https://www.jetbrains.com/pycharm/guide/tutorials/sphinx_sites/customizing/

## Default Font

- https://stackoverflow.com/questions/42748537/change-default-font-in-sphinx-documentation



## Logo and Images

- image_
  - https://docs.readthedocs.io/en/stable/index.html
- conf.py
  - html_title = "Documentation python "
  - html_logo = "images/logo.png"
  - html_favicon = "images/favicon.png"
  - html_logo = "_static/python-logo-generic.svg"
- python logo 
  - cd _static
  - wget https://www.python.org/static/community_logos/python-logo-generic.svg
  - cd ..


## Buttons

  use_edit_page_button      : true
  use_repository_button     : true
  use_issues_button         : true




## Journey

### Graphixz

- 
```
    'sphinx.ext.graphviz',
```


### Bibliography

- https://sphinxcontrib-bibtex.readthedocs.io/en/latest/usage.html
- index
- conf.py
  - bibtex_bibfiles = ['_page/references.bib']
- references.bib




### Math Equation

- Math Equation only works in rst not in md
- 




### Logo Elfant

- https://pydata-sphinx-theme.readthedocs.io/en/latest/
- https://github.com/pydata/pydata-sphinx-theme/blob/main/docs/user_guide/customizing.rst


### 2022-06-20___custom_css

- conf.py
- html_static_path = ['_static']
- html_css_files = ["custom.css"]



### get-started



- https://sphinx-book-theme.readthedocs.io/en/stable/tutorials/get-started.html
- conf.py
 ```
  - html_theme_options = {
    ...
    "repository_url": "https://github.com/{your-docs-url}",
    "use_repository_button": True,
    ...
  }
  ```


### 2022-06-16

- Update the main script
  - H:homepage and S:Source, S:Sphinx and 
- conf.py
  - html_theme = 'furo'
  - html_theme = 'sphinx-book-theme'
  - conda install -c conda-forge sphinx-book-theme


### 2022-06-15

- jupyter-book
- https://github.com/executablebooks/jupyter-book
- sphinx-book-theme
  - https://sphinx-book-theme.readthedocs.io/en/stable/
  - https://github.com/executablebooks/sphinx-book-theme
  - https://github.com/pradyunsg/sphinx-book-theme

### 2022-06-14

- https://github.com/pradyunsg
- https://sphinx-themes.org/
- ablog
  - https://ablog.readthedocs.io/en/latest/
  - https://gdevops.gitlab.io/tuto_ablog/index.html
- sphinx-basic-ng
  - https://sphinx-basic-ng.readthedocs.io/en/latest/
  - https://github.com/pradyunsg/sphinx-basic-ng
  - https://github.com/pradyunsg/sphinx-basic-ng/
 
