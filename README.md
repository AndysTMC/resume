# Resume

LaTeX source for [Thatikonda Mukesh](https://andystmc.me)'s resume.

One canonical `resume.tex` on `main`, sharing `resume.sty`. Targeted variants, if they appear later, are extra `resume-*.tex` files — not branches. Frozen copies live on [GitHub Releases](https://github.com/AndysTMC/resume/releases/latest), created from date tags.

## Latest PDF

[Latest release](https://github.com/AndysTMC/resume/releases/latest)

Every push also builds a working-copy PDF as a workflow artifact.

## Build locally

Needs [TeX Live](https://www.tug.org/texlive/) with `latexmk`, including the packages in `resume.sty` (a full install is enough).

```bash
make
```

That writes `resume.pdf` (gitignored). `make clean` removes aux files and the PDF.

## Freeze a version

Tags are `YYYY.MM.DD`, or `YYYY.MM.DD.N` if you freeze twice the same day. Do not move a published tag.

```bash
git tag 2026.08.17
git push origin 2026.08.17
```

CI attaches `resume-2026.08.17.pdf` to a GitHub Release of the same name.

## Docs

- How to operate here: [AGENTS.md](AGENTS.md)
- Why these choices: [docs/decisions/](docs/decisions/_index.md)
