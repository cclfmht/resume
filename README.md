This is the repository for my master resume.

The master resume can be compiled to different versions. Each version can opt-in which items to use in the source file. The resumes are compiled using `latexmk` and `GNU Make`, please ensure you have them installed on your system.

### Compile Resumes
To compile all versions, run
```bash
make
```
You can also specify a version by its name:
```bash
make <version>
```

### Output Directory
All compiled artifacts would be put under `build` directory by default. The output directory can be specified using `OUTDIR` variable:
```bash
make OUTDIR=<output-directory>
```

### Open Resumes
To open the compiled resumes, run
```bash
make open
```
You can also specify which version to open with `OPEN` variable:
```bash
make open OPEN=<version>
```
Note that if you open a version that is not yet generated, you don't need to compile it first, Make will automatically compile it before
opening.

### Source File Location
By default, source file is put at `master/resume.tex`, but you can specify the it using `SOURCE` variable:
```bash
make SOURCE=<master-source>
```

### Add a New Version
Thanks to Make, adding new version can be quite easy. Just append the version name to `VERSIONS` variable in `Makefile`, and then you can start opt-in the items you want to show for that version in the resume source.

### List All Versions
The following command lists all available versions:
```bash
make versions
```
