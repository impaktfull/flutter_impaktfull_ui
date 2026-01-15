## Development

Use the same naming conventions and styles as the rest of the codebase.

## Changelog

Update CHANGELOG.md to match what changed in the code.
Use the following format:

fix/chore/docs/ci -> 0.0.x fix/chore/docs/ci
feat -> 0.x.0 features
feat! -> x.0.0 breaking change

## Validate

Make sure the formatting is correct.

```
./tool/format.sh
```

## Create Pull Request

Pull requests are created on Github. `main` branch is the default branch.
But all changes pushed to the default branch should be done through a pull request.
