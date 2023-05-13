# README

Export WordPress to Markdown using
[wordpress-export-to-markdown](https://github.com/lonekorean/wordpress-export-to-markdown).

1. Use [Tools Export Screen](https://wordpress.org/documentation/article/tools-export-screen/)
and select `All content` and `Download Export file`.
2. Install Node.js.

On Debian.

```console
sudo apt install -y nodejs npm
node -v
# v12.22.12
```

Note the path of your WordPress export XML file and run the following.

```console
npx wordpress-export-to-markdown
```

Done!
