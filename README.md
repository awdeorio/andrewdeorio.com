# andrewdeorio.com
Andrew DeOrio's website

Source code for [andrewdeorio.com](http://andrewdeorio.com)


## Documentation
- [Fomantic UI](https://fomantic-ui.com/introduction/getting-started.html) CSS library.
- [Academic Icons](https://jpswalsh.github.io/academicons/) for things like ORCID, Google Scholar, etc.
- [Bibble](https://github.com/sampsyo/bibble) automated publications list generator.


## Deploy
Generate the publications list with [Bibble](https://github.com/sampsyo/bibble).  Insert the output in `docs/index.html`.
```console
$ ./publications_run_bibble.sh
```

Verify HTML5 compliance.
```console
$ html5validator --root docs
```

Check for dead links.
```console
$ linkchecker --check-extern docs/index.html
```

Copy to web server.
```console
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
rsync -rvp --delete --checksum docs/ awdeorio@web.eecs.umich.edu:public_html/
```

### Automated deploy
FIXME
