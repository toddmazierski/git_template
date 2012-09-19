# .git_template

A Git template that contains a few helpful hooks written in Ruby.

## Installation

  1. Clone the repository into your home folder:

        $ cd
        $ git clone git@github.com:toddmazierski/.git_template.git

  2. Configure Git to use the template globally:

        $ git config --global init.templatedir "~/.git_template"

  3. New repositories: when you `git init`, the template will be copied

  4. Existing repositories: if you `git init`, the template will be copied, with one important caveat: **existing files are not overwritten** (unfortunately, if updates are made to the template, they must be manually copied over)

## TODO

  * Language conditionals
  * Automated way to update template globally in all repositories
