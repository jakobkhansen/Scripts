#! /bin/bash
pandoc $1 --standalone -c https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.css -t html | sed '/<body>/c\<body class="markdown-body">' | weasyprint - output.pdf
