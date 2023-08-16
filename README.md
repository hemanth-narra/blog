# Prose

Prose is a blogging platform written in Go, which I am building to serve my own blog.

## Setup

As of July 2023, `libsass` is no longer available, so the environment running this binary must have access to `sass` on the PATH.

## Usage

Blog posts should be created in the format `title-slug.md`. Work in progress posts should be stored as `WIP-title-slug.md`. Static content should be stored in the `static/` folder, appropriately arranged.

Posts will be served as `/title-slug`, and files like `static/random/file/structure.txt` will be served as `/random/file/structure.txt`. When title slugs and static files conflict, slugs will have higher precdence. An RSS feed of the blog is available at `/rss.xml`.

To start the server:

	go run .

Server will be live on port 8080.

## Running in Docker 

1. Clone this repository. `git clone https://github.com/hemanth-narra/prose.git`

2. Build the image `docker build -t prose-blog .`

3. Deploy the image `docker run -p 8080:8080 -v /path/to/your/posts:/go/src/app/posts prose-blog`

4. Visit `http://localhost:8080` in your web browser to view your blog.

# Credits
Thanks to [Naman sood](https://twitter.com/tendstofortytwo) for making [Prose](https://github.com/tendstofortytwo/prose)
