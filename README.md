# Emacs build scripts

For building Emacs for, and under, Windows (using MINGW).

## TODO

  * [ ] Have `VERSION` & `THALL_SUFFIX_VERSION` read from file

## Changelog

### 30.1

- Introduce vars `$VERSION` & `$THALL_VERSION_SUFFIX` in scripts
- **`libjansson`** and **--with-json** flag removed**: *Emacs now has a json parser*
- **--with-native-compilation** flag removed: *Native compilation enabled by default*
- Add conf. flag **--disable-gc-mark-trace**: *Expect +~5% GC perf. increase*
