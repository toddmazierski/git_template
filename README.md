# .git_template

A Git template that contains a few helpful hooks written in Ruby.

## Installation

  1. Clone the repository into your home folder:

        $ cd
        $ git clone git@github.com:toddmazierski/.git_template.git

  2. Configure Git to use the template globally:

        $ git config --global init.templatedir "~/.git_template"

  3. New repositories:

        $ git init

  4. Existing repositories:

        $ rm -rf .git/hooks
        $ git init

## TODO

  * Language conditionals
