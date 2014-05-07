# git_template

A Git template that contains a few helpful hooks written in Ruby.

## Installation

  1. Clone the repository:

    ```bash
    cd ~/mycode # anywhere is fine
    git clone git@github.com:toddmazierski/git_template.git 
    ```
 
  2. Symlink to your home folder:

    ```bash
    ln -s ~/mycode/git_template ~/.git_template
    ```

  3. Configure Git to use the template globally:

    ```bash
    git config --global init.templatedir "~/.git_template"
    ```

  4. For new repositories, the hooks will be automatically installed:

    ```bash
    git init
    ```

  5. For existing repositories, reinitialize the repository:

    ```bash
    rm -rf .git/hooks
    git init
    ```

## Experimental

To update the hooks for multiple, existing repositories:

```bash
ruby script/update_hooks.rb ~/mycode
```

## TODO

  * Language conditionals
