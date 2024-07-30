fig-code-chunk
==================================================================

[![GitHub build status][CI badge]][CI workflow]

This filter transforms a figure block into R markdown style code chunk to include figure.

[CI badge]: https://img.shields.io/github/actions/workflow/status/Abhi-1U/fig-code-chunk/ci.yaml?branch=main
[CI workflow]: https://github.com/Abhi-1U/fig-code-chunk/actions/workflows/ci.yaml


Usage
------------------------------------------------------------------


```
input-format: LaTeX
```


```
output-format: Rmarkdown / markdown
```


### Plain pandoc

Pass the filter to pandoc via the `--lua-filter` (or `-L`) command
line option.

    pandoc --lua-filter fig-code-chunk.git.lua ...

License
------------------------------------------------------------------

This pandoc Lua filter is published under the MIT license, see
file `LICENSE` for details.
