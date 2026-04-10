# Curriculum Vitae Template

[![Releases](https://img.shields.io/github/v/release/maximilian-hammerl/cv-template)](https://github.com/maximilian-hammerl/cv-template/releases)
![Downloads](https://img.shields.io/github/downloads/maximilian-hammerl/cv-template/total)
[![Top Language](https://img.shields.io/github/languages/top/maximilian-hammerl/cv-template)](https://github.com/maximilian-hammerl/cv-template/search?l=typst)

> **Disclaimer:** This repository (and the CV repository that uses it) was created as a fun side project and should not
> be taken too seriously. It is not intended to be a particularly serious or efficient way to manage a CV — it just
> happened to be an enjoyable thing to build. Expect rough edges.

This repository contains the template for my curriculum vitae, built with [Typst](https://typst.app) – a modern, fast
markup-based typesetting system designed as an alternative to LaTeX.

## Structure

- [`main.typ`](main.typ) - Main CV document
- [`compile.sh`](compile.sh) - Build script to generate the CV PDFs for all translations
- [`content/`](content/) - General and language-specific content such as texts and images (German and English)
- [`fonts/`](fonts/) - Fonts used in the CV
- [`icons/`](icons/) - Icons used in the CV
- [`dist/`](dist/) - Generated PDFs

## Using the Template

To use this template for your own CV:

1. Fill out your personal details in `content/general.yaml`.
2. Add at least one translation in `content/translations/` (e.g. `english.yaml` or `german.yaml`).
3. Replace the profile picture at `content/images/profile-picture.png` with your own.
4. Run `./compile.sh` to generate the PDFs into `dist/`.

## Download

The latest versions of the CV template with example data are available in
the [Releases](https://github.com/maximilian-hammerl/cv-template/releases) section in both
[**German**](https://github.com/maximilian-hammerl/cv-template/releases/latest/download/cv-german.pdf) and
[**English**](https://github.com/maximilian-hammerl/cv-template/releases/latest/download/cv-english.pdf).

## Workflows

### Release (`release.yml`)

Triggered automatically when a tag matching `v*.*.*` is pushed. It compiles all CV PDFs via `compile.sh` and creates a
GitHub release with the generated PDFs attached and auto-generated release notes. The release workflow is built to
support immutable releases — you can enforce this by enabling
[release immutability](https://docs.github.com/en/code-security/concepts/supply-chain-security/immutable-releases)
in your repository settings.

### Sync Template (`sync-template.yml`)

Used in a repository created from this template to pull in upstream changes. It can be triggered manually via
`workflow_dispatch`, or you can uncomment the `schedule` block to run it automatically on a cron schedule. It opens a
pull request with any changes from this template repository, allowing you to review and merge them selectively.

> **Note:** For this workflow to be able to open pull requests, you need to allow GitHub Actions to create and approve
> pull requests. This can be enabled under `https://github.com/<user>/<repository>/settings/actions` in the "Workflow
> permissions" section.

### Validate (`validate.yml`)

Triggered on every push and pull request. It validates all translation YAML files in `content/translations/` against
the JSON schema defined in `content/translations-schema.yaml`, ensuring that the content structure is correct.

## Licensing

This repository uses multiple licenses:

- The Typst template and build script are licensed under the [MIT License](LICENSE-template.md). This includes:
  `main.typ`, `compile.sh`, and other generic template/build files unless noted otherwise.
- The personal CV content is not open source and is [All Rights Reserved](LICENSE-content.md). This includes: All files
  containing CV text/content such as the image files, translation files, generated files, and other personal assets.
- Fonts, icons, and other third-party assets are subject to their own upstream licenses and are not relicensed by this
  repository.
