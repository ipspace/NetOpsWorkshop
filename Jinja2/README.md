# Test cases for YAML and Jinja2

This directory contains numerous test cases used to illustrate how to create complex data structures in YAML and how to use them in Jinja2 templates. The _includes_ subdirectory is used to test Jinja2 include functionality, _ipaddr_ directory contains test cases for Ansible **ipaddr** Jinja2 filter, _whitespace_ directory has test cases illustrating whitespace handling when using Jinja2 with Ansible.

The main directory also includes *render.py* that can be used to render YAML data structure with corresponding Jinja2 template.

## Invoking render.py

The easiest way to invoke **render.py** is simply <code>./render.py <em>somename</em></code>. Specify just the file name, not the extension (for example, 1-basics and not 1-basics.yml). Using this syntax the script expects to find:

* Data structure in _somename_.yml
* Jinja2 template in _somename_.j2

If you want to use YAML and Jinja2 files with different names or different extensions specify the file names individually. Using this syntax you have to use full file names (including extensions)
<pre>./render.py -yaml <em>yamlfile</em> -jinja <em>jinja2file</em></pre>
Note: you can use -y instead of -yaml and -j instead of -jinja2

## Additional parameters

You can use these command line options to change **render.py** behavior:

* -n or -notrim: do not trim whitespace (sets **trim_blocks** and **lstrip_blocks**)
* -w or -warning: report usage of undefined variables
* -s or -strict: fail on undefined variables

