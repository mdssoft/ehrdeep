# Cache export index

This folder contains `all.xml` (InterSystems Cache export). For fast pinpoint analysis, use the generated index and split source files.

## Build index and split files

```bash
npm run mis:index
```

Or directly:

```bash
node bin/cache-export.js build cos-mis/full_src/all.xml cos-mis/full_src/indexed
```

## Quick lookup

List entities by substring:

```bash
node bin/cache-export.js list YIPAC
```

Get exact entity metadata (file path + line range in `all.xml`):

```bash
node bin/cache-export.js get YIPAC
```

## Output structure

- `indexed/index.json`: full index (`kind`, `name`, attrs, line ranges, extracted file path)
- `indexed/by-name.json`: quick map by exact name
- `indexed/src/<Kind>/<Name>.<ext>`: extracted code blocks (`Routine` -> `.mac`)

After build, use ripgrep for fast code search:

```bash
rg -n "NEXT\^IPAC" cos-mis/full_src/indexed/src
```
