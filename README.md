# andrewdeorio.com
Andrew DeOrio's website

Source code for [andrewdeorio.com](http://andrewdeorio.com)

## Documentation
- [Fomantic UI CSS library](https://fomantic-ui.com/introduction/getting-started.html)
- [Academic Icons](https://jpswalsh.github.io/academicons/)

## Debug
Watch for changes and automatically update on http://localhost:4000
```
jekyll serve --watch
```

Check W3C compliance<br>
https://validator.w3.org/nu/?doc=http://andrewdeorio.com/

Check links<br> https://validator.w3.org/checklink?uri=http%3A%2F%2Fandrewdeorio.com&hide_type=all&recursive=on&depth=150&check=Check


## Deploy
Manual build and deploy
```
jekyll build
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
rsync -rvp --delete --checksum _site/ awdeorio@web.eecs.umich.edu:public_html/
```

Or simply
```
./deploy
```
