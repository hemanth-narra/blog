## Running in Docker 

1. Clone this repository. `git clone https://github.com/hemanth-narra/blog.git`

2. Build the image `docker build -t blog .`

3. Deploy the image `docker run -p 8080:8080 -v /DATA/AppData/Prose/posts:/go/src/app/posts blog`

4. Visit `http://localhost:8080` in your web browser to view your blog.

# Credits
Thanks to [Naman sood](https://twitter.com/tendstofortytwo) for making [Prose](https://github.com/tendstofortytwo/prose)
