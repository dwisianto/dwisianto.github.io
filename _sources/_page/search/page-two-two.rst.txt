
Title22
=======


A Plain Title
-------------

This is the text of the section.

It refers to the section title, see :ref:`A Plain Title`.


Section
-------




MathJax
~~~~~~~~

If :math:`\sigma_{1}` equals :math:`\sigma_{2}` then etc, etc.

then :math:`\underline{x}=[  x_{1}, ...,  x_{n}]^{T}`

Graphviz
~~~~~~~~

.. graphviz::

   digraph foo {
      "bar" -> "baz";
   }


.. digraph:: foo

   "bar" -> "baz" -> "quux";


Graphviz2
~~~~~~~~~~


.. graphviz::
    :name: sphinx.ext.graphviz
    :caption: Sphinx and GraphViz Data Flow
    :alt: How Sphinx and GraphViz Render the Final Document
    :align: center

     digraph "sphinx-ext-graphviz" {
         size="6,4";
         rankdir="LR";
         graph [fontname="Verdana", fontsize="12"];
         node [fontname="Verdana", fontsize="12"];
         edge [fontname="Sans", fontsize="9"];

         sphinx [label="Sphinx", shape="component",
                   href="https://www.sphinx-doc.org/",
                   target="_blank"];
         dot [label="GraphViz", shape="component",
              href="https://www.graphviz.org/",
              target="_blank"];
         docs [label="Docs (.rst)", shape="folder",
               fillcolor=green, style=filled];
         svg_file [label="SVG Image", shape="note", fontcolor=white,
                 fillcolor="#3333ff", style=filled];
         html_files [label="HTML Files", shape="folder",
              fillcolor=yellow, style=filled];

         docs -> sphinx [label=" parse "];
         sphinx -> dot [label=" call ", style=dashed, arrowhead=none];
         dot -> svg_file [label=" draw "];
         sphinx -> html_files [label=" render "];
         svg_file -> html_files [style=dashed];
     }


References
~~~~~~~~~~

See :cite:t:`1987:nelson` for an introduction to non-standard analysis.
Non-standard analysis is fun :cite:p:`1987:nelson`.

.. bibliography::
