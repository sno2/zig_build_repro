# Generated file dependency through module bug

Run

```
zig build
```

to reproduce. Run

```
rm -rf .zig-cache foo/.zig-cache foo/foo.txt
```

between runs.
