# git_template

A Git template that contains a few helpful hooks written in Ruby.

## Installation

  1. Clone the repository:
      ```bash
      cd ~/code
      git clone git@github.com:toddmazierski/git_template.git
      ```

  1. Configure Git to use the template globally:
      ```bash
      git config --global init.templatedir "~/code/git_template"
      ```

  1. For new repositories, the hooks will be automatically installed:
      ```bash
      git init
      ```

  1. For existing repositories, reinitialize the repository:
      ```bash
      rm -rf .git/hooks
      git init
      ```

## Experimental

To update the hooks for multiple, existing repositories:

```bash
ruby script/update_hooks.rb ~/code
```

## TODO

  * Language conditionals
