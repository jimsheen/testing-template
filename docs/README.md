### Typescript Library Template

This base setup contains the following;
- ADR tooling
- Commit Enforcement
- Pre-commit hooks
- A test suite
- CHANGELOG

## ADR Tooling
Architecture Decision Records are a methodology for recording a series of changes a system undergoes, in order to provide a point of reference for developers. What should be recorded? ADs such as making changes to database fields, implementing significant new functionality, making a breaking change, or introducing a new library. Feel free to read more about ADRs [here](https://perfectward.atlassian.net/wiki/spaces/EN/pages/875364521/Architecture+Decision+Records)

You can create a new ADR document by running `yarn adr`, the command line will then promt you with a few questions such as the document title and whether it is a new document or a follow up from previous article. Once you fill these out, a new .md file is generated in the form of <timestamp><title> within the docs/adr folder where you'll be able to fill out the article entirely. You will also be given the link for a preview should that be one of your options.

**Related files:**
- docs/adr/*
- .log4brains.yml

## Commit Enforcement
Your commit message will be linted, if it doesn't conform to the standard you'll not be allowed to make the commit. You can find how this works [here](https://perfectward.atlassian.net/wiki/spaces/EN/pages/863207488/Commit+Guidelines)

Generally, the commit style is in the form of <commit type>:<commit message>, for example, the commit type has to be one of the following:
- docs
- feat
- fix
- test

Click [here](https://github.com/conventional-changelog/commitlint) for a more comprehensive list of allowed commit types.

**Related files:**
- .husky/commit-msg
- commitlint.config.js

## Pre-commit Hooks
Before your commit goes through, your staged files will be linted against the code standards and all tests will be ran. Upon the sucessful test run and code lint, the files will be committed. Otherwise, feedback will be given as to which stage has failed and you'll have to resolve this and re-commit your changes again.

**Related files:**
- .husky/pre-commit
- lint-staged.config.js
- .eslintrc
- .eslintignore
- .prettierrc
- .prettierignore

## Test Suite
You are able to run all tests with `yarn test` or you can trigger watch mode with `yarn test:watch`, for instance, you may choose to only run the previously failing tests or only tests related to the changed files etc.

**Related files:**
- test/*
- jest.config.js

## CHANGELOG
Once you have made changes that warrant a version bump, you can run `yarn release` which will bump up the version in .templateversion, outputs your changes to CHANGELOG.md and commits the changes (which will trigger the pre-commit hook process). You will then be prompted to push your changes up with `git push --follow-tags origin <branch>`.

Alternatively, you may choose to run the release with `yarn release:dry-run` which allows you to see what commands would be run, without committing to git or updating files.

**Related files:**
- .templateversion
- .versionrc.js
- CHANGELOG.md

## Other Commands

- `yarn build` => compiles the typescript project
- `yarn prepare` => one time command to enable git hooks
- `yarn lint` => lints all files in the project and reports on findings
- `yarn lint:fix` => lints all files in project and automatically fixes them
