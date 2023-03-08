## README

[Original
post](https://davetang.org/muse/2018/02/09/organising-computational-biology-projects-cookiecutter/)
is reproduced with `run.sh`.

```console
pip install cookiecutter
```

### Tips

[One
directory](https://cookiecutter.readthedocs.io/en/latest/advanced/directories.html)
can be used to store all Cookiecutter templates making it easier to organise
your templates. Use the `--directory` option to activate a specific template
within a subdirectory.

```console
cookiecutter https://github.com/user/repo-name.git --directory="directory-name"
```

In addition Cookiecutter can use GitHub repositories as input (as seen in the
example above).

### Tutorial one

See [Getting to Know
Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/tutorials/tutorial1.html).

Works with a GitHub repo.

```console
cookiecutter https://github.com/audreyfeldroy/cookiecutter-pypackage.git
```

### Tutorial two

[Create a Cookiecutter From
Scratch](https://cookiecutter.readthedocs.io/en/latest/tutorials/tutorial2.html#tutorial2)
tutorial, which creates `cookiecutter-website-simple`, a cookiecutter for
generating simple, bare-bones websites.

### Conditional

Demonstration of a [choice
variable](https://cookiecutter.readthedocs.io/en/latest/advanced/choice_variables.html)
via `choice.sh`.

### Dictionary

Demonstration of a [dictionary
variables](https://cookiecutter.readthedocs.io/en/latest/advanced/dict_variables.html)
as a choice via `dict.sh`.
