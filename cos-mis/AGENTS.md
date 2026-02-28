# Date/Time Utilities Guide for `cos-mis` (Cache Object Script / M / MUMPS)

This directory relies on `DTUTL.int` as the core helper routine for date/time parsing, formatting, arithmetic, and comparison.

Source analyzed: `cos-mis/DTUTL.int`.

## 1) Canonical internal format (always prefer this)

- Internal date/time is `$H`-compatible:
  - Date: integer day counter (`+X`).
  - DateTime: `day,seconds` (e.g., `67234,45296`).
- Most conversion functions accept either full `day,seconds` or date-only `day`.
- Empty input usually returns empty output (`""`) rather than throwing errors.

## 2) Primary conversion functions

### Internal -> human-readable

- `DT(X)` -> `dd.mm.yyyy`
- `DT2(X)` -> `dd.mm.yy`
- `DTISO(X)` -> `yyyy-mm-dd`
- `DTIME(X)` -> `d Mon yyyy hh:mm:ss` (English month short name)
- `DTM(X)` -> `dd.mm.yyyy hh:mm:ss`
- `DTM2(X,Y4)` -> `dd.mm.yy, hh:mm` or 4-digit year when `Y4=1`
- `TIME(X)` -> `hh:mm:ss`
- `TM(X)` -> `hh:mm`
- `DTEXT(X,NY)` -> Russian textual date (`"d <month> yyyy"`, optional `" г."` suffix)

### Human-readable -> internal

- `DI(X)` -> parse date into internal day (`$H` day)
  - supports many separators (`.`, `/`, `-`, `\`, spaces)
  - supports numeric and short textual months
  - supports 2-digit and 4-digit years with century heuristics
- `DTI(X)` -> parse `date time` into `day,seconds`
- `DIISO(X)` -> ISO date (`yyyy-mm-dd`) to internal day
- `IISO(X)` -> ISO datetime (`yyyy-mm-ddThh:mm:ss...`) to `day,seconds`
- `TI(X)` -> `hh:mm[:ss]` to seconds
- `IGMT(DTM)` -> RFC822-like GMT string to internal datetime

## 3) Extractors and calendar helpers

- `YEAR(X)`, `MONTH(X)`, `DAY(X)`
- `DAYMN(X)` -> day-of-month as zero-padded string
- `DWEEK(HH)` -> weekday number (1..7)
- `DWKNM(D)`, `DWKNML(D)` -> weekday names (RU full/short)
- `WKNUM(HH)` -> week number inside month
- `QDT(D)` -> quarter number
- `EOFMN(X)` -> boolean: is last day of month
- `EOFM(X)` -> returns last day of month as internal date
- `YLEAP(year)` -> leap-year check (also accepts `$H` date)

## 4) Arithmetic and differences

- `AFTERD(DTM,D)` -> add days, keeps time part
- `AFTERMN(X,P)` -> add months (`P`, default 1)
- `AFTERY/AFTERYY/AFTERYD` -> add years (different output flavors)
- `MONTHS(D1,D2)` -> months between dates (iterative)
- `MNBTW(H1,H2)` -> minutes difference
- `TMBTW(H1,H2)` -> seconds difference
- `BTW(H1,H2)` -> difference as `day,seconds`
- `SECINDAY(H1,H2)` -> second diff when dates are near each other
- `CMPDTM(DTM1,DTM2)` -> compare datetimes (-1/0/1)

## 5) Text presentation helpers

- `MNNM(M)` -> month name (RU)
- `TMT(TM)` -> textual time in RU (`"X ч. Y мин."`)
- `DAYT`, `MONTHT`, `YEART` -> RU pluralization helpers
- `AGE(D1,D2)`, `AGET(D1,D2)` -> age (numeric/text)
- `TXTP(D1,D2)` -> textual period string

## 6) Working principles for new COS/M code in `cos-mis`

1. **Store and compare in internal format** (`$H` day or `day,seconds`). Convert only at boundaries (UI, export, API).
2. **Use `DTUTL` converters, do not duplicate date math**. Especially for leap years, month boundaries, and legacy formats.
3. **Validate parser output**: `DI/DTI/DIISO/IISO` may return `""`; always check before arithmetic.
4. **Be explicit about output format**:
   - external API -> prefer `DTISO` / `DTMISO24`
   - UI/report legacy -> `DT`, `DT2`, `DTM`, `DTEXT`
5. **When adding months/years, use provided helpers** (`AFTERMN`, `AFTERY*`) instead of naive day offsets.
6. **When comparing datetimes, use `CMPDTM`** instead of manual string comparison.
7. **Handle time-only values through seconds helpers** (`TI`, `TIME`, `TM`) and keep day/time separation clear.
8. **Be careful with locale**:
   - some functions output English month/day abbreviations (`DTIME`, `GMT`),
   - others output Russian text (`DTEXT`, `MNNM`, `DWKNM*`).
9. **Understand 2-digit year behavior** in `DI`: century is inferred by heuristic (`CENTURY()` and current `$H`). Prefer 4-digit years in new integrations.
10. **Know current limitations**: `AFTERMN` forces Feb day >28 to 28 (marked TODO in source), so account for this in business logic.

## 7) Recommended minimal patterns

- Parse inbound user date:
  - `S d=$$DI^DTUTL(input) Q:d="" "<handle invalid date>"`
- Parse inbound datetime:
  - `S dt=$$DTI^DTUTL(input) Q:dt="" "<handle invalid datetime>"`
- Format for API (ISO):
  - `S out=$$DTISO^DTUTL(d)`
- Safe comparison:
  - `S cmp=$$CMPDTM^DTUTL(dt1,dt2) ; -1,0,1`

---

When implementing new logic in `cos-mis`, treat this file as the date/time convention baseline.
